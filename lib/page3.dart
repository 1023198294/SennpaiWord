import 'package:flutter/material.dart';

class VisualizeWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new VisualizeWidgetState();
  }
}

class VisualizeWidgetState extends State<VisualizeWidget>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('可视化'),
      ),
      body: new Center(
        child: Icon(Icons.visibility,size: 130.0,color: Colors.blue,),
      ),
    );
  }
}