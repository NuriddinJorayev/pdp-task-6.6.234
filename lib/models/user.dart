class User{
  String name;
  String salary;
  String age;
  int id;

  User(this.name, this.salary, this.age, this.id);
  User.FromJson(Map<String, dynamic> json)
  :name = json["name"],
  salary = json["salary"],
  age = json["age"],
  id = json["id"];

  Map<String, dynamic> ToJson() => {
    'name' : name,
    'salary' : salary,
    'age' : age,
    'id' : id,
  };

}