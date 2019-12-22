import 'package:flutter_app/userinfo/user_info.dart';

class UserInfoData{
  /*
    单例模式
  */
  static final UserInfoData _instanceUser = UserInfoData.__internal();
  UserInfo transdata;
  factory UserInfoData(){
    return _instanceUser;
  }
  UserInfoData.__internal();
}

final userInfoData = UserInfoData();

