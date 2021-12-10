import 'package:flutter/material.dart';
import 'package:pdp_task_6_6_234/pages/delete_page.dart';
import 'package:pdp_task_6_6_234/pages/post_page.dart';
import 'package:pdp_task_6_6_234/pages/update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Button_Builder("Post Method", 1),
            Button_Builder("Update Method", 2),
            Button_Builder("Delete Method", 3),
           
          ],
        ),
      ),
      
    );
  }
  Widget Button_Builder(text, pageIndex){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: ElevatedButton(
        onPressed: (){
          switch(pageIndex){
            case 1: {PageOpener(PostPage()); break;}
            case 2: {PageOpener(Update_page()); break;}
            case 3: {PageOpener(Delete_page()); break;}
          }
        }, 
        child: Container(
          height: 45.0,
          width: double.infinity,
          child: Center(
            child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18.0)),
          ),
        )
        ),
    );
  }
  PageOpener(var route){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> route));
  }
}
