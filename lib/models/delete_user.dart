// "status": "success",
//     "data": "1",
//     "message": "Successfully! Record has been deleted"

class Delete_User{
  String status;
  String data;
  String message;
  Delete_User(this.status, this.data, this.message);

  Delete_User.FromJson(Map<String, dynamic> json)  
  :status = json["status"],
  data = json["data"],
  message = json["message"];

  Map<String, dynamic> ToJson() => {
    'status' : status,
    'data' : data,
    'message' : message,
  };
}