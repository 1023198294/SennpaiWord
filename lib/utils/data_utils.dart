import 'dart:convert';
import 'package:convert/convert.dart';
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_app/userinfo/user_info_data.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/api/api.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/userinfo/user_info.dart';
import 'package:flutter_app/utils/net_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:zefyr/zefyr.dart';
class DataUtils{
// ----------login page-------------
  static Future doLogin(Map<String,dynamic> params) async{

      var response = await NetUtils.post(Api.DO_SIGNIN, params);
      //final prefs = await SharedPreferences.getInstance();
      //await prefs.setBool('if_login', true);
    return response['data'];
  }
  static Future checkLogin() async{

    final prefs = await SharedPreferences.getInstance();
    var if_login1 = prefs.getBool('if_login');
    //return if_login;
    var if_login2 = userInfoData.transdata.haslogin;
    if (if_login2 == null )
      return false;
    if(if_login2 == false)
      return false;
    return if_login1 || if_login2;
  }
  static Future doSignUp(Map<String,dynamic> params) async{
    var response = await NetUtils.post(Api.DO_SIGNUP, params);
    return response['data'];
    //await prefs.setBool('if_login', true);
  }
  static Future TestLogOut() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('if_login', false);
    return true;
  }
  static Future doLogOut() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('if_login',false);
  }

//-----------page1first---------
  static Future getInfoUserOverview(Map<String,dynamic> params,String uid,String infotype) async{
//    print(uid);
    var response = await NetUtils.get(Api.GET_INFO_USER+'/overview', params);
//    print('overview:');
//    print(response);
    if (response['message'] == 0)
      return response['data'];
  }

//  static Future getInfoUserTest(Map<String,dynamic> params,String uid,int timestamp) async{
//    var response = await NetUtils.get(Api.GET_INFO_USER+'/'+uid+'/'+timestamp.toString(), params);
//    return response['data'];
//  }
//-------------page1second---------------

  static Future getWordList(Map<String,dynamic> params) async{
    var url = Api.GET_INFO_USER+'/plan/list';
    var response = await NetUtils.get(url, params);
    print(url);
    return response['data'];
  }//1.0.1

  static Future getInfoWord(Map<String,dynamic> params,String wid) async{
    var response = await NetUtils.get(Api.GET_INFO_WORD+ '/'+wid, params);
    return response['data'];
  }

  static Future postRecord(Map<String,dynamic> params, String uid,) async{
    var url = Api.POST_RECORD;
//    print(params);
    var response = await NetUtils.post(url, params);
    //print(url);
    return response['data'];
  }

  //---------changebooklist--------------

  static Future getPlanList(Map<String,dynamic> params) async{
    var response = await NetUtils.get(Api.GET_PLAN, params);
    return response['data'];
  }//1.0.1

  static Future postPlan(Map<String,dynamic> params, String uid,) async{
//    print(params);
    var response = await NetUtils.post(Api.GET_INFO_USER+'/plan', params);
    return response['data'];
  }


//-----------page3-------------
  static Future getVisualRecord(Map<String,dynamic> params, String uid) async{
    var url = Api.POST_RECORD;
    var response = await NetUtils.get(url, params);
    return response['data'];
  }

//--------------page2----------------
  static Future getPlanRecord(Map<String,dynamic> params, String uid) async{
    var url = Api.GET_PLAN;
    var response = await NetUtils.get(url, params);
    return response['data'];
  }

  static Future postPlanRecord(Map<String,dynamic> params, String uid,) async{
    var url = Api.POST_RECORD;
//    print(params);
    var response = await NetUtils.post(url, params);
    return response;
  }








//  ---------page4-----------
  static Future postFeedBack(Map<String,dynamic> params) async{
    var response = await NetUtils.post(Api.POST_FEEDBACK, params);
    return response['data'];
  }

  static Future doTestApi(Map<String,dynamic> params)async{
    var response = await NetUtils.post(Api.Test_API+'/17341059', params);
    return response['data'];
  }




  //----------general---------------------------------------------------------------------------------

  static String encodeBase64(String data){
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }
  static String decodeBase64(String data){
    return String.fromCharCodes(base64Decode(data));
  }
  static Future image2Base64(var path)async{
    File file = path;
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }
  static Future base642Image(String base64Txt) async {
    Uint8List decodeTxt = base64.decode(base64Txt);
    //return Image.memory(decodeTxt, width:100,fit: BoxFit.fitWidth, gaplessPlayback:true);//防止重绘
    return MemoryImage(decodeTxt);
  }
  static Future imageFile2Base64(File file) async {
    List<int> imageBytes = await file.readAsBytes();
    return base64Encode(imageBytes);
  }
  static Future getUserInfo() async{
    var response = await NetUtils.post(Api.GET_INFO_USER+'/info',{});
    return response['data'];
    }
  static Future postUserInfo(String uid) async{
    var response = await NetUtils.post(Api.GET_INFO_USER+'/info',
        {
          'data':
          {
            'Uname':userInfoData.transdata.username,
            'Avatar':userInfoData.transdata.avatarpic,
            'Sex':'M',
            'Education':'',
            'Grade':''
          }
        }
    );
    //print('post info data :'+userInfoData.transdata.avatarpic);
    return response['data'];
  }//no usage
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
}



String _encode(Object object) =>
    const JsonEncoder.withIndent(' ').convert(object);

