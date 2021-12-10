

import 'package:flutter/material.dart';
import 'package:pdp_task_6_6_234/models/post_user.dart';
import 'package:pdp_task_6_6_234/models/user.dart';
import 'package:pdp_task_6_6_234/restApi/Rest_api.dart';

class PostPage extends StatefulWidget {
  const PostPage({ Key? key }) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
    
  late Future<PostUser> futureUser;
  var ob = User("nuriddin", "12345", "21", 1);

  @override
  void initState() {
    super.initState();
    futureUser = Rest_API.Post(Rest_API.PostParam(ob));
    futureUser.then((value) => print(value.status +'\n' + value.data.name + "\n" + value.message));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Post Page"),
      ),
      body: FutureBuilder<PostUser>(
        future: futureUser,
        builder: (context, snap){
          if(snap.hasData){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("status: ${snap.data!.status}"),
                  Text("data: {${snap.data!.data.name}, ${snap.data!.data.age}, ${snap.data!.data.salary}, ${snap.data!.data.id}}"),
                  Text("message: ${snap.data!.message}"),
                ],
              ),
            );
          }
          else return Center(
            child: CircularProgressIndicator());
        },

      ),
    );
  }
}