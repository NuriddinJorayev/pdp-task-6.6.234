import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pdp_task_6_6_234/models/post_user.dart';
import 'package:pdp_task_6_6_234/models/put_user.dart';
import 'package:pdp_task_6_6_234/models/user.dart';
import 'package:pdp_task_6_6_234/restApi/Rest_api.dart';

class Update_page extends StatefulWidget {
  const Update_page({ Key? key }) : super(key: key);

  @override
  _Update_pageState createState() => _Update_pageState();
}

class _Update_pageState extends State<Update_page> {
     
  late Future<PutUser> futureUser;
  User ob = User("nurik", "987456321", "20", 12);

  @override
  void initState() {
    super.initState();
    futureUser = Rest_API.Put(Rest_API.PutParam(ob));
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Update Page"),
      ),
      body: FutureBuilder<PutUser>(
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
          }        
          else return Center(child: CircularProgressIndicator());
        },

      ),
    );
  }
}