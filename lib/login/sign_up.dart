import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/login.dart';
import 'package:flutter_app/userinfo/user_info.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app/main.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  var _username = '';
  var _pnumber = '';
  var _password = '';
  var _email = '';
  var _sex = '';
  var isLoading = false;
  var _isShowNameClear = false;
  var _isShowEmailClear = false;
  var _isShowPhoneClear = false;
  var _isShowPwd = false;
  FocusNode _focusNodeUserName= new FocusNode();
  FocusNode _focusNodeUserPhone= new FocusNode();
  FocusNode _focusNodeUserPassWord = new FocusNode();
  FocusNode _focusNodeUserEmail = new FocusNode();
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _userPhoneController = new TextEditingController();
  TextEditingController _userEmailController = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  void initState() {
    super.initState();
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodeUserPassWord.addListener(_focusNodeListener);
    _focusNodeUserEmail.addListener(_focusNodeListener);
    _focusNodeUserPhone.addListener(_focusNodeListener);

    _userNameController.addListener(() {
      print(_userNameController.text);
      if (_userNameController.text.length > 0) {
        _isShowNameClear = true;
      } else {
        _isShowNameClear = false;
      }
      setState(() {});
    });
    _userEmailController.addListener(() {
      print(_userEmailController.text);
      if (_userEmailController.text.length > 0) {
        _isShowEmailClear = true;
      } else {
        _isShowEmailClear = false;
      }
      setState(() {});
    });
    _userPhoneController.addListener(() {
      print(_userPhoneController.text);
      if (_userPhoneController.text.length > 0) {
        _isShowPhoneClear = true;
      } else {
        _isShowPhoneClear = false;
      }
      setState(() {});
    });
  }
  @override
  void dispose(){
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodeUserPassWord.removeListener(_focusNodeListener);
    _focusNodeUserPhone.removeListener(_focusNodeListener);
    _focusNodeUserEmail.removeListener(_focusNodeListener);
    _userNameController.dispose();
    _userPhoneController.dispose();
    _userEmailController.dispose();
    super.dispose();
  }
  Future _focusNodeListener() async{
    if(_focusNodeUserName.hasFocus) {
      print('focus on username');
      _focusNodeUserPassWord.unfocus();
      _focusNodeUserEmail.unfocus();
      _focusNodeUserPhone.unfocus();
    }
    if(_focusNodeUserPassWord.hasFocus){
      print('focus on password');
      _focusNodeUserName.unfocus();
      _focusNodeUserEmail.unfocus();
      _focusNodeUserPhone.unfocus();
    }
    if(_focusNodeUserEmail.hasFocus) {
      print('focus on email');
      _focusNodeUserPassWord.unfocus();
      _focusNodeUserName.unfocus();
      _focusNodeUserPhone.unfocus();
    }
    if(_focusNodeUserPhone.hasFocus) {
      print('focus on phone number');
      _focusNodeUserPassWord.unfocus();
      _focusNodeUserName.unfocus();
      _focusNodeUserEmail.unfocus();
    }
  }
  String validatePhone(value){
    // 正则匹配手机号
    RegExp exp = RegExp(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if (value.isEmpty) {
      return '用户名不能为空!';
    }else if (!exp.hasMatch(value)) {
      return '请输入正确手机号';
    }
    return null;
  }
  String validatePassWord(value){
    if (value.isEmpty) {
      return '密码不能为空';
    }
    //else if(value.trim().length18){
    //  return '密码长度不正确';
    //}
    return null;
  }
  String validateUserName(value){
    if (value.isEmpty) {
      return '用户名不能为空';
    }
    //else if(value.trim().length18){
    //  return '密码长度不正确';
    //}
    return null;
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    print(ScreenUtil().scaleHeight);
    Widget inputTextArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white
      ),
      child: new Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new TextFormField(
                controller: _userNameController,
                focusNode: _focusNodeUserName,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'username',
                  hintText: 'user name',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: (_isShowNameClear)?IconButton(icon: Icon(Icons.clear),onPressed: (){
                    _userNameController.clear();
                  },)
                      :null ,
                ),
                validator: validateUserName,
                onSaved: (String value){
                  _username = value;
                  print('username = $_username');
                }
            ),

            new TextFormField(
                controller: _userPhoneController,
                focusNode: _focusNodeUserPhone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'phone',
                  hintText: 'phone number',
                  prefixIcon: Icon(Icons.phone),
                  suffixIcon: (_isShowPhoneClear)?IconButton(icon: Icon(Icons.clear),onPressed: (){
                    _userPhoneController.clear();
                  },)
                      :null ,
                ),
                validator: validatePhone,
                onSaved: (String value){
                  _pnumber = value;
                  print('phonenumber = $_pnumber');
                }
            ),

            new TextFormField(
                controller: _userEmailController,
                focusNode: _focusNodeUserEmail,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'email',
                  hintText: 'email',
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: (_isShowEmailClear)?IconButton(icon: Icon(Icons.clear),onPressed: (){
                    _userEmailController.clear();
                  },)
                      :null ,
                ),
                validator: validateUserName,
                onSaved: (String value){
                  _email = value;
                  print('username = $_email');
                }
            ),

            new TextFormField(

                focusNode: _focusNodeUserPassWord,
                decoration: InputDecoration(
                  labelText: 'password',
                  hintText: 'password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon((_isShowPwd) ? Icons.visibility : Icons.visibility_off),
                    // 点击改变显示或隐藏密码
                    onPressed: (){
                      setState(() {
                        _isShowPwd = !_isShowPwd;
                      });
                    },
                  ),
                ),
                obscureText: !_isShowPwd,
                validator: validatePassWord,
                onSaved: (String value){
                  _password = value;
                }
            ),
          ],
        ),
      ),
    );
    Widget signUpButtonArea = new Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        height: 45.0,
        child: new RaisedButton(
          color: Colors.blue[300],
          child: Text(
            'Sign in',style: Theme.of(context).primaryTextTheme.headline,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: (){
            _focusNodeUserName.unfocus();
            _focusNodeUserPassWord.unfocus();
            _focusNodeUserEmail.unfocus();
            _focusNodeUserPhone.unfocus();

            if (_formKey.currentState.validate()) {
              //只有输入通过验证，才会执行这里
              _formKey.currentState.save();
            }
            setState(() {
              isLoading = true;
            });
            DataUtils.doSignUp({
              'username':_username,
              'email':_email,
              'pnumber':_pnumber,
              'password':_password
            }).then((userResult){
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context)=>BottomNavigationWidget()),(route)=>route == null
              );//directly to the home page
            });
          },
        )
    );
    Widget FinalPage =  WillPopScope(
      child:Scaffold(
        backgroundColor: Colors.white,
        // 外层添加一个手势，用于点击空白部分，回收键盘
        body: new GestureDetector(
          onTap: (){
            // 点击空白区域，回收键盘
            print("点击了空白区域");
            _focusNodeUserPassWord.unfocus();
            _focusNodeUserName.unfocus();
            _focusNodeUserPhone.unfocus();
            _focusNodeUserEmail.unfocus();
          },
          child: new ListView(
            children: [
              new SizedBox(height: ScreenUtil().setHeight(70),),
              inputTextArea,
              new SizedBox(height: ScreenUtil().setHeight(80),),
              signUpButtonArea,
            ],
          ),
        ),
      ),
      onWillPop: (){
        print('点击了返回键');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context)=>LoginPage()),(route)=>route == null
        );//directly to the home page
      },
    );
    /*DataUtils.checkLogin().then((result){
      if (result)
        return FinalPage;
      else
        return BottomNavigationWidget;
    });*/
    return FinalPage;
  }
}