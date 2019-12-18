import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedBackPage extends StatefulWidget{
  @override
  State<FeedBackPage> createState(){
    return FeedBackPageState();
  }
}
class FeedBackPageState extends State<FeedBackPage>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

        child:Scaffold(
      appBar: AppBar(
        title: Text('用户反馈'),
        actions: <Widget>[

        ],
      ),
    ),
      onWillPop: () {
        print('点击了返回键');
        Navigator.pop(context, null);
      }
    );
  }

}