import 'dart:convert';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/userinfo/user_info.dart';
import 'package:flutter_app/utils/net_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DataUtils{

  static Future doLogin(Map<String,String> params) async{
    //var response = await NetUtils.post(Api.DO_LOGIN, params);
    final prefs = await SharedPreferences.getInstance();
    final response = {
      'data': {
        'avatarPic': null,
        'userid': 114514,
        'username': 'tadokoro',
      }
    };
    //UserInfo userInfo = UserInfo.fromJson(response['data']);
    await prefs.setBool('if_login', true);
    return true;
  }
  static Future checkLogin() async{
    final prefs = await SharedPreferences.getInstance();
    var if_login = prefs.getInt('if_login');
    return if_login;
  }
}

String _encode(Object object) =>
    const JsonEncoder.withIndent(' ').convert(object);