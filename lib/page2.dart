import 'package:flutter/material.dart';

class RecordPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new RecordPageWidgetState();
  }
}

class RecordPageWidgetState extends State<RecordPageWidget>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('记录'),
      ),
      body: new Center(
        child: Icon(Icons.event_note,size: 130.0,color: Colors.blue,),
      ),
    );
  }
}