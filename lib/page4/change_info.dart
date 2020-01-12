import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/userinfo/user_info_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zefyr/zefyr.dart';
import 'package:notus/convert.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ChangeInfoPage extends StatefulWidget{
  @override
  State<ChangeInfoPage> createState(){
    return ChangeInfoPageState();
  }
}
class ChangeInfoPageState extends State<ChangeInfoPage> {
  var _imgPath;
  var _img;
  var _base64Txt = '';
  var _username;
  var _userId;
  TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _username = userInfoData.transdata.username;
      _userId = userInfoData.transdata.userid;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)
      ..init(context);

    Widget inputTextArea =Form(

    child: Column(

      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(
              labelText: '用户名',
              labelStyle: TextStyle(
                  color: Colors.black
              ),
              prefixIcon: Icon(Icons.person, color: Colors.black,)
          ),
          onChanged: (s) => _username = s,
          controller: _usernameController,
        )
      ],
    ),
    );
    Widget uploadButtonArea = new Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        height: 45.0,
        child: new RaisedButton(
          color: Colors.blue[300],
          child: Text(
            '确认修改', style: Theme
              .of(context)
              .primaryTextTheme
              .headline,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          onPressed: () {
            print(_usernameController.text);
            setState(() {
              userInfoData.transdata.username = _usernameController.text;
              //userInfoData.transdata.avatarpic = '0';
            });
            DataUtils.postUserInfo(
                userInfoData.transdata.userid
            ).then((userResult) {
              if (userResult != null){
                Fluttertoast.showToast(msg: 'update info complete!');
                Navigator.pop(context, null);
              }
            });
          },
        )
    );
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text('修改信息'),
          ),
          body: new GestureDetector(
            onTap: () {
              // 点击空白区域，回收键盘
              print("点击了空白区域");
            },
            child: new ListView(
              children: [
                new SizedBox(height: ScreenUtil().setHeight(70),),
                inputTextArea,
                new SizedBox(height: ScreenUtil().setHeight(80),),
                uploadButtonArea,
              ],
            ),
          ),

        ),

        onWillPop: () {
          print('点击了返回键');
          Navigator.pop(context, null);
        }
    );
  }
}