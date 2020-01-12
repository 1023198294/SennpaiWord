import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zefyr/zefyr.dart';
import 'package:notus/convert.dart';
class SelectListPage extends StatefulWidget{
  @override
  State<SelectListPage> createState(){
    return SelectListPageState();
  }
}
class SelectListPageState extends State<SelectListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child:Scaffold(
          appBar: AppBar(
            title: Text('用户反馈'),
          ),
          body: Scaffold(
          ),
        ),
        onWillPop: () {
          print('点击了返回键');
          Navigator.pop(context, null);
        }
    );
  }
}
