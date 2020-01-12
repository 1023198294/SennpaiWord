import 'package:flutter/material.dart';
var availableList = ['CET4','CET6','TOEFL','GRE','IETLS'];
class UserInfo{
  String userid; //default 0
  String username; //default 'tadokoro kouji'
  String password ; // default none
  String avatarpic ; // default '0'
  String email ;//default '1145141919@810.com'
  String pnumber;
  String sex ;//default 'M'
  String wordlist ;//default 'None'
  String education;//default 'Undergraduate'
  bool haslogin=false;//default false
  var plan;
  //var defaultpic =NetworkImage(
  //    'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1575981417&di=654891dd70bee883c0f3c499f186582c&src=http://pic4.zhimg.com/50/v2-882fb1a465545c31301b9e7f9dfa9fc7_r.jpg');

  UserInfo({this.userid='0',this.username='tadokoro kouji',this.password='',this.avatarpic='0',this.email='1145141919@810.com',this.pnumber='11451419198',this.sex='U',this.wordlist='None',this.education='Undergraduate',this.haslogin=false});
  factory UserInfo.fromJson(Map<String,dynamic> json){
    String userId = json['userid'];
    String userName = json['username'];
    if (json['username'] != null){
      userName = json['username'];
    }else{
      userName = 'tadokoro kouji';
    }

    String passWord;
    if (json['password'] != null){
      passWord = json['password'];
    }else{
      passWord = '';
    }

    String avatarPic;
    if (json['avatarPic'] != null){
      avatarPic = json['avatarPic'];
    }else{
      avatarPic = '0';
    }
    String email;
    if (json['email'] != null){
      email = json['email'];
    }else{
      email = '0';
    }
    String pnumber;
    if (json['pnumber'] != null){
      pnumber = json['pnumber'];
    }else{
      pnumber = '11451419198';
    }
    String sex;
    if (json['sex'] != null){
      sex = json['sex'];
    }else{
      sex = 'U';
    }
    String wordList;
    if (json['wordlist'] != null){
      wordList = json['wordlist'];
    }else{
      wordList = 'None';
    }
    String education;
    if (json['education'] != null){
      education = json['education'];
    }else{
      education = 'Undergraduate';
    }

    bool hasLogin = true;
    return UserInfo(
      userid: userId,
      username: userName,
      password: passWord,
      avatarpic:avatarPic ,
      email: email,
      pnumber: pnumber,
      sex: sex,
      wordlist:wordList ,
      education: education,
      haslogin: hasLogin
    );
  }
  @override
  bool operator == (other){
    return(userid == other._userid) &&(password == other.password);
  }
}