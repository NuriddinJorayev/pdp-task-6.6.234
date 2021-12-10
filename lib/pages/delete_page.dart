
import 'package:flutter/material.dart';
import 'package:pdp_task_6_6_234/models/delete_user.dart';
import 'package:pdp_task_6_6_234/models/user.dart';
import 'package:pdp_task_6_6_234/restApi/rest_api.dart';

class Delete_page extends StatefulWidget {
  const Delete_page({ Key? key }) : super(key: key);

  @override
  _Delete_pageState createState() => _Delete_pageState();
}

class _Delete_pageState extends State<Delete_page> {
       
  late Future<Delete_User> futureUser;
  var ob = User("nuriddin", "12345", "21", 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUser = Rest_API.Del(1);

  }
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Delete Page"),
      ),
      body: FutureBuilder<Delete_User>(
        future: futureUser,
        builder: (context, snap){
          if(snap.hasData){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("status: ${snap.data!.status}"),
                  Text("data: {${snap.data!.data}}"),
                  Text("message: ${snap.data!.message}"),
                ],
              ),
            );
          }else          
           return Center(child: CircularProgressIndicator());
        },

      ),
    );
  }
}