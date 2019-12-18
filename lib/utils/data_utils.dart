import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_app/api/api.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/userinfo/user_info.dart';
import 'package:flutter_app/utils/net_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DataUtils{

  static Future doLogin(Map<String,dynamic> params) async{
    /*
      var response = await NetUtils.post(Api.DO_SIGNIN, params);
      UserInfo userInfo = UserInfo.fromJson(response['data']);
    */
    final prefs = await SharedPreferences.getInstance();

    final response = {
      'data': {
        'avatarPic': null,
        'userid': 114514,
        'username': 'tadokoro',
      }
    };//just for test
    await prefs.setBool('if_login', true);
    return response;
  }
  static Future checkLogin() async{

    final prefs = await SharedPreferences.getInstance();
    var if_login = prefs.getBool('if_login');
    return if_login;
  }
  static Future doSignUp(Map<String,dynamic> params) async{

    final prefs = await SharedPreferences.getInstance();
    var response = await NetUtils.post(Api.DO_SIGNUP, params);
    return response['data'];
    //await prefs.setBool('if_login', true);
  }
  static Future TestLogOut() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('if_login', false);
    return true;
  }
  static Future doLogOut(Map<String,dynamic> params) async{
    final prefs = await SharedPreferences.getInstance();
    var response = await NetUtils.post(Api.DO_LOGOUT,params);
    prefs.setBool('if_login',false);
    return response['data'];
  }
  static Future getInfoUserOverview(Map<String,dynamic> params,int uid,String infotype) async{
    var response = await NetUtils.post(Api.GET_INFO_USER+'/'+uid.toString()+'/overview', params);
    return response['data'];
  }

  static Future getInfoUserTest(Map<String,dynamic> params,int uid,int timestamp) async{
    var response = await NetUtils.post(Api.GET_INFO_USER+'/'+uid.toString()+'/'+timestamp.toString(), params);
    return response['data'];
  }

  static Future getInfoWord(Map<String,dynamic> params,int wid) async{
    var response = await NetUtils.post(Api.GET_INFO_USER+'/word/'+wid.toString(), params);
    return response['data'];
  }
  static Future getPlan(Map<String,dynamic> params,int uid) async{
    var response = await NetUtils.post(Api.GET_INFO_USER+'/plan/'+uid.toString(), params);
    return response['data'];
  }
  static Future postFeedBack(Map<String,dynamic> params,int uid) async{
    var response = await NetUtils.post(Api.POST_FEEDBACK, params);
    return response['data'];
  }



  static Future doTestApi(Map<String,dynamic> params)async{
    var response = await NetUtils.post(Api.Test_API+'/17341059', params);
    return response['data'];
  }
}



String _encode(Object object) =>
    const JsonEncoder.withIndent(' ').convert(object);