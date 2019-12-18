import 'package:flutter_app/utils/data_utils.dart';
class Api {
  static const String BASE_SERVER = 'http://111.231.250.160';//到时补充
  static const String BASE_PORT = ':9102';
  static const String BASE_URL = BASE_SERVER+BASE_PORT;
  static const String CHECK_SIGNIN = BASE_URL + '/checksignin';

  static const String DO_SIGNIN = BASE_URL +  '/signin';
  static const String DO_SIGNUP = BASE_URL + '/signup';
  static const String DO_LOGOUT = BASE_URL + '/logout';

  static const String GET_INFO_USER = BASE_URL + '/user';
  static const String GET_INFO_WORD = BASE_URL + '/word';

  static const String GET_PLAN = BASE_URL + '/plan';

  static const String POST_FEEDBACK = BASE_URL + '/feedback';


  static const String Test_API = BASE_URL +'/test';
  void test(){
  }
}