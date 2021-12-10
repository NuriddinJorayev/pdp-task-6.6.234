import 'dart:convert';

import 'package:pdp_task_6_6_234/models/user.dart';

class PostUser{
  String status;
  User data;
  String message;
  
  PostUser(this.status, this.data, this.message);
  PostUser.FromJson(Map<String, dynamic> json)
  :status = json["status"],
  data = User.FromJson(json["data"]),
  message = json["message"];

  Map<String, dynamic> ToJson() => {
    'status' : status,
    'data' : data.ToJson(),
    'message' : message,
  };
}