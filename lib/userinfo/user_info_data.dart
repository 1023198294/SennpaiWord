import 'package:flutter_app/userinfo/user_info.dart';
import '../page1/quiz_brain.dart';
class UserInfoData{
  /*
    单例模式
  */
  static final UserInfoData _instanceUser = UserInfoData.__internal();
  UserInfo transdata;
  QuizBrain quizBrain = QuizBrain();
  factory UserInfoData(){
    return _instanceUser;
  }
  UserInfoData.__internal();
}

final userInfoData = UserInfoData();

