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
        child: LoginScreen2(
          backgroundColor1: Color(0xFF444152),
          backgroundColor2: Color(0xFF6f6c7d),
          highlightColor: Color(0xfff65aa3),
          foregroundColor: Colors.white,
//        logo: new AssetImage("assets/images/full-bloom.png"),
        ),
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

