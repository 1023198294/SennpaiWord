import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'page1/first_page.dart';

class HomePageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomePageWidgetState();
  }
}

class HomePageWidgetState extends State<HomePageWidget>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('首页'),
//      ),
      body: Container(
        child: LoginScreen2(),
      ),
    );
  }
}


//new Center(
//child: Column(children: <Widget>[
//Icon(Icons.home,size: 130.0,color: Colors.blue,),
//RaisedButton(
//child: new Text('Launch new screen'),
//onPressed: () {
//Navigator.push(
//context,
//new MaterialPageRoute(builder: (context) => new SecondScreen()),
//);
//},
//),
//],
//),
//),

