import 'dart:convert';

import 'package:pdp_task_6_6_234/models/user.dart';

class PutUser{
    String status;
  var data;
  String message;
  
  PutUser(this.status, this.data, this.message);
  PutUser.FromJson(Map<String, dynamic> json)
  :status = json["status"],
  data =json['data'],
  message = json["message"];

  Map<String, dynamic> ToJson() => {
    'status' : status,
    'data' : data,
    'message' : message,
  };
}