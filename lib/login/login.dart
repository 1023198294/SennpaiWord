import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/userinfo/user_info.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/login/sign_up.dart';
class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  var _username = '';
  var _password = '';
  var isLoading = false;
  var _isShowClear = false;
  var _isShowPwd = false;
  FocusNode _focusNodeUserName= new FocusNode();
  FocusNode _focusNodeUserPassWord = new FocusNode();
  TextEditingController _userNameController = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodeUserPassWord.addListener(_focusNodeListener);
    _userNameController.addListener(() {
      print(_userNameController.text);
      if (_userNameController.text.length > 0) {
        _isShowClear = true;
      } else {
        _isShowClear = false;
      }
      setState(() {});
    });
  }
  Future _focusNodeListener() async{
    if(_focusNodeUserName.hasFocus) {
      print('focus on username');
      _focusNodeUserPassWord.unfocus();
    }
    if(_focusNodeUserPassWord.hasFocus){
      print('focus on password');
      _focusNodeUserName.unfocus();
    }
  }
  @override
  void dispose(){
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodeUserPassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }
  String validateUserName(value){
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
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    print(ScreenUtil().scaleHeight);
    Widget logoImageArea = new Container(
      alignment: Alignment.topCenter,
      child: ClipOval(
        child: Image.asset(
          'images/logo.jpg',
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
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
                hintText: 'phone number',
                prefixIcon: Icon(Icons.person),
                suffixIcon: (_isShowClear)?IconButton(icon: Icon(Icons.clear),onPressed: (){
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
    Widget loginButtonArea = new Container(
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

          if (_formKey.currentState.validate()) {
            //只有输入通过验证，才会执行这里
            _formKey.currentState.save();
            //todo 登录操作 , 非测试环境下把下面的代码黏上来
            print("$_username log in with password $_password");
          }
          setState(() {
            isLoading = true;
          });
          DataUtils.doLogin(
              {
                'data':{
                  'type':1,
                  'username':_username,
                  'password':_password
                }
          }).then((userResult){
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context)=>BottomNavigationWidget()),(route)=>route == null
            );//directly to the home page
          });
          },
      )
    );
    Widget thirdLoginArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      child: new Column(
        children: [
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 80,
                height: 1.0,
                color: Colors.grey,

              ),
              Text(
                  '第三方登录'
              ),
              Container(
                width: 80,
                height: 1.0,
                color: Colors.grey,
              ),
            ],
          ),
          new SizedBox(
            height: 18,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                color: Colors.green[200],
                // 第三方库icon图标
                icon: Icon(FontAwesomeIcons.weixin),
                iconSize: 40.0,
                onPressed: (){
                },
              ),
              IconButton(
                color: Colors.blue[600],
                icon: Icon(FontAwesomeIcons.facebook),
                iconSize: 40.0,
                onPressed: (){
                },
              ),
              IconButton(
                color: Colors.blue[200],
                icon: Icon(FontAwesomeIcons.qq),
                iconSize: 40.0,
                onPressed: (){
                },
              )
            ],
          )
        ],
      ),
    );
    Widget bottomArea = new Container(
      margin: EdgeInsets.only(right: 20,left: 30),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            child: Text(
              "忘记密码?",
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: 16.0,
              ),
            ),
            //忘记密码按钮，点击执行事件
            onPressed: (){
              DataUtils.doTestApi(
                  {
                  'data':{
                  'username':'hyj0',
                  'password':'12345678',
                  'phone':12345678901,
                }
              }).then((res){
                print(res);
              });
            },
          ),
          FlatButton(
            child: Text(
              "快速注册",
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: 16.0,
              ),
            ),
            //点击快速注册、执行事件
            onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new SignUpPage()), (Route route) => route == null);
            },
          )
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      // 外层添加一个手势，用于点击空白部分，回收键盘
      body: new GestureDetector(
        onTap: (){
          // 点击空白区域，回收键盘
          print("点击了空白区域");
          _focusNodeUserPassWord.unfocus();
          _focusNodeUserName.unfocus();
        },
        child: new ListView(
          children: [
            new SizedBox(height: ScreenUtil().setHeight(80),),
            logoImageArea,
            new SizedBox(height: ScreenUtil().setHeight(70),),
            inputTextArea,
            new SizedBox(height: ScreenUtil().setHeight(80),),
            loginButtonArea,
            new SizedBox(height: ScreenUtil().setHeight(60),),
            thirdLoginArea,
            new SizedBox(height: ScreenUtil().setHeight(60),),
            bottomArea,
          ],
        ),
      ),
    );
  }
}