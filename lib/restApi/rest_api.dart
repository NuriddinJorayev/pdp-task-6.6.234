import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pdp_task_6_6_234/models/delete_user.dart';
import 'package:pdp_task_6_6_234/models/post_user.dart';
import 'package:pdp_task_6_6_234/models/put_user.dart';
import 'package:pdp_task_6_6_234/models/user.dart';

class Rest_API {
  static String base = "dummy.restapiexample.com";
  static String postURL = "/api/v1/create";
  static String putURL = "/api/v1/update/"; // = 21
  static String deleteURL = "/api/v1/delete/"; // = 2
  static Map<String, String> header = {};
    // post 
  static Future<PostUser> Post(Map<String, String> body) async{
    var uri = Uri.http(base, postURL);
    var res = await http.post(uri, headers: header, body: body);
    if (res.statusCode == 200){
      return PostUser.FromJson(jsonDecode(res.body));
    }
    var v;
    return v;
  }
  // put 
  static Future<PutUser> Put(Map<String, String> body) async{
    var uri = Uri.http(base, putURL + "21");
    var res = await http.put(uri, headers: header, body: body);
    if (res.statusCode == 200){ 
      print(res.statusCode);
      return PutUser.FromJson(jsonDecode(res.body));
    }
    var v;
     print(res.statusCode);
    return v;
  }
  // delete
  static Future<Delete_User> Del(id) async{
    var uri = Uri.http(base, deleteURL + id.toString(),);
    var res = await http.delete(uri, headers: header,);
    if (res.statusCode == 200){ 
      print(res.statusCode);
      return Delete_User.FromJson(jsonDecode(res.body));
    }
    var v;
     print(res.statusCode);
    return v;
  }

   static Map<String, String> PostParam(User p){
    Map<String, String> map = {
    'name' : p.name,
    'salary' : p.salary.toString(),
    'age' : p.age.toString(),
    'id' : p.id.toString(),
    };
    return map;
  }
     static Map<String, String> PutParam(User p){
    Map<String, String> map = {
    'name' : p.name,
    'salary' : p.salary.toString(),
    'age' : p.age.toString(),
    'id' : p.id.toString(),
    };
    return map;
  }
}
