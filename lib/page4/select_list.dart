import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zefyr/zefyr.dart';
import 'package:notus/convert.dart';
class UpdateInfoPage extends StatefulWidget{
  @override
  State<UpdateInfoPage> createState(){
    return UpdateInfoPageState();
  }
}
class UpdateInfoPageState extends State<UpdateInfoPage> {
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
            title: Text('版本更新'),
          ),
          body: Scaffold(
            body: Text('当前已是最新版本,无需更新'),
          ),
        ),
        onWillPop: () {
          print('点击了返回键');
          Navigator.pop(context, null);
        }
    );
  }
}
