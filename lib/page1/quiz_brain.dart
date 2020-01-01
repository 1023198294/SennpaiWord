
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:flutter_app/userinfo/user_info.dart';
import 'package:flutter_app/userinfo/user_info_data.dart';

class QuizBrain {

  int _questionNumber = 0;

  List<Q> _questionBank = [
    Q(
        'good',
        '好的',
        '好的',
        '猫',
        '8',
        '电',
        'good   adj.  好\n\nDalao is a good person.\n'),
    Q(
        'bad',
        '坏的',
        '好的',
        '坏的',
        '8',
        '电',
        'bad   adj.  坏\n\nDalao is not a bad person.\n'),
  ];


    int getQuestionNumber() {
    return _questionNumber;
    }

    List<Q> getQuestionBank() {
    return _questionBank;
    }

    void nextQuestion() {
//    print('!!!');
    if (_questionNumber < _questionBank.length - 1) {
    _questionNumber++;
    }

//    if (_qInfoNumber < _qInfoBank.length - 1) {
//      _qInfoNumber++;
//    }

    }

    String getQuestionText() {
    return _questionBank[_questionNumber].ques;
    }
    String getExplanation() {
    return _questionBank[_questionNumber].explanation;
    }
    String getCorrectAnswer() {
    return _questionBank[_questionNumber].ans;
    }

    List<String> getABCD() {
    return [_questionBank[_questionNumber].choiceA,
    _questionBank[_questionNumber].choiceB,
    _questionBank[_questionNumber].choiceC,
    _questionBank[_questionNumber].choiceD,
    ];
    }
//----------------------------------------
    bool isFinished() {
//    if (_questionNumber >= _questionBank.length - 1) {
//
//    print('Now returning true');
//    return true;
//
//    } else {
//    return false;
//    }
    if (_qInfoNumber >= _qInfoBank.length - 1) {

      print('Now returning true');
      return true;

    } else {
      return false;
    }
    }

    void reset() {
//    _questionNumber = 0;
    _qInfoNumber = 0;
    }
//--------------------------

  int _qInfoNumber = 0;
  dynamic tmp;// for bitchy bug
  List<Qinfo> _qInfoBank = List();
  int quizNumber = 0;

  Map<String,Worddetail> _wDetBank = new Map();



  int getCurNum(){
    return _qInfoNumber;
  }

  void createQInfoBank(dynamic wordlist) {
//    _qInfoNumber = 0;
    if (_qInfoBank != null)
      _qInfoBank.clear();
//    print(wordlist['todayLearn']);

    if (wordlist['todayLearn'] != null) {

      for (int i = 0; i < wordlist['todayLearn'].length; ++i) {
        var tmp = wordlist['todayLearn'][i];
//        print(tmp);
        _qInfoBank.add(
            Qinfo(tmp[0], tmp[1], tmp[2], tmp[3], 'learn'));
        if (_wDetBank.containsKey(tmp[1]) == false){
          DataUtils.getInfoWord(
            {},
            tmp[1],
          ).then((v){
//        print(wordInfoResult);
            _wDetBank[tmp[1]] = Worddetail(v['English'], v['Chinese'][0], v['Psymbol']);
//            print(_wDetBank[tmp[1]]);
          });
//          print(_wDetBank[tmp[1]].eng);
        }
        if (_wDetBank.containsKey(tmp[3][0]) == false){
          DataUtils.getInfoWord(
            {},
            tmp[3][0],
          ).then((v){
//        print(wordInfoResult);
            _wDetBank[tmp[3][0]] = Worddetail(v['English'], v['Chinese'][0], v['Psymbol']);
//            print(_wDetBank[tmp[3][0]]);
          });
//          print(_wDetBank[tmp[3][0]]);
        }
        if (_wDetBank.containsKey(tmp[3][1]) == false){
          DataUtils.getInfoWord(
            {},
            tmp[3][1],
          ).then((v){
//        print(wordInfoResult);
            _wDetBank[tmp[3][1]] = Worddetail(v['English'], v['Chinese'][0], v['Psymbol']);
//            print(_wDetBank[tmp[3][1]]);
          });
//          print(_wDetBank[tmp[3][1]]);
        }
        if (_wDetBank.containsKey(tmp[3][2]) == false){
          DataUtils.getInfoWord(
            {},
            tmp[3][2],
          ).then((v){
//        print(wordInfoResult);
            _wDetBank[tmp[3][2]] = Worddetail(v['English'], v['Chinese'][0], v['Psymbol']);
//            print(_wDetBank[tmp[1]]);
          });
//          print(_wDetBank[tmp[1]]);
        }
        if (_wDetBank.containsKey(tmp[3][3]) == false){
          DataUtils.getInfoWord(
            {},
            tmp[3][3],
          ).then((v){
//        print(wordInfoResult);
            _wDetBank[tmp[3][3]] = Worddetail(v['English'], v['Chinese'][0], v['Psymbol']);
//            print(_wDetBank[tmp[1]]);
          });
//          print(_wDetBank[tmp[1]]);
        }

      }
    }
    else if (wordlist['todayReview'] != null) {
      var tmp = wordlist['todayReview'];
      for (int i = 0; i < wordlist['todayReview'].length; ++i) {
        _qInfoBank.add(
            Qinfo(tmp[0], tmp[1], tmp[2], tmp[3], 'review'));
        if (_wDetBank.containsKey(tmp[1]) == false){
          DataUtils.getInfoWord(
            {},
            tmp[1],
          ).then((v){
//        print(wordInfoResult);
            _wDetBank[tmp[1]] = Worddetail(v['English'], v['Chinese'][0], v['Psymbol']);
//            print(_wDetBank[tmp[1]]);
          });
//          print(_wDetBank[tmp[1]]);
        }
        if (_wDetBank.containsKey(tmp[3][0]) == false){
          DataUtils.getInfoWord(
            {},
            tmp[3][0],
          ).then((v){
//        print(wordInfoResult);
            _wDetBank[tmp[3][0]] = Worddetail(v['English'], v['Chinese'][0], v['Psymbol']);
//            print(_wDetBank[tmp[3][0]]);
          });
//          print(_wDetBank[tmp[3][0]]);
        }
        if (_wDetBank.containsKey(tmp[3][1]) == false){
          DataUtils.getInfoWord(
            {},
            tmp[3][1],
          ).then((v){
//        print(wordInfoResult);
            _wDetBank[tmp[3][1]] = Worddetail(v['English'], v['Chinese'][0], v['Psymbol']);
//            print(_wDetBank[tmp[3][1]]);
          });
//          print(_wDetBank[tmp[3][1]]);
        }
        if (_wDetBank.containsKey(tmp[3][2]) == false){
          DataUtils.getInfoWord(
            {},
            tmp[3][2],
          ).then((v){
//        print(wordInfoResult);
            _wDetBank[tmp[3][2]] = Worddetail(v['English'], v['Chinese'][0], v['Psymbol']);
//            print(_wDetBank[tmp[1]]);
          });
//          print(_wDetBank[tmp[1]]);
        }
        if (_wDetBank.containsKey(tmp[3][3]) == false){
          DataUtils.getInfoWord(
            {},
            tmp[3][3],
          ).then((v){
//        print(wordInfoResult);
            _wDetBank[tmp[3][3]] = Worddetail(v['English'], v['Chinese'][0], v['Psymbol']);
//            print(_wDetBank[tmp[1]]);
          });
//          print(_wDetBank[tmp[1]]);
        }

      }
    }
  }

  int getLength(){
    if (_wDetBank.length == 0)
      return 0;
    if (_qInfoBank.length == 0)
      return 0;
    return 1;
  }

  Worddetail getWord(String key){
//    print(_wDetBank.length);
    return _wDetBank[key];
  }



  void nextQInfo() {
    if (_qInfoNumber < _qInfoBank.length - 1) {
      _qInfoNumber++;
    }
  }

  Qinfo getQInfo() {
    return _qInfoBank[_qInfoNumber];
  }


  String getQInfoWid() {
//    print(_qInfoNumber);
//    print(_qInfoBank);

    return _qInfoBank[_qInfoNumber].wid;

  }
//  String getExplanation() {
//    return _questionBank[_questionNumber].explanation;
//  }
//  String getCorrectAnswer() {
//    return _questionBank[_questionNumber].ans;
//  }
//
  dynamic getQInfoOpt() {
//    print('opt:');
//    print(_qInfoBank[_qInfoNumber].options);

    return _qInfoBank[_qInfoNumber].options;
  }


  bool isFinishedd() {
    if (_qInfoNumber >= _qInfoBank.length - 1) {

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }
  void resett() {
    _qInfoNumber = 0;
  }

  }

//class Question {
//  String questionText;
//  bool questionAnswer;
//
//  Question(String q, bool a) {
//    questionText = q;
//    questionAnswer = a;
//  }
//}


class Qinfo{
  String tid;
  String wid;
  int proficiency;
  List <dynamic> options;
  String attribute; // 'learn' or 'review'
  bool correctWrong = false;


  Qinfo(String t, String id, int p, List<dynamic> opt, String att) {
    tid = t;
    wid = id;
    proficiency = p;
    options = opt;
    attribute = att;
  }

  void setCorrectWrong(key) {
    correctWrong = key;
  }
  bool getCorrectWrong() {
    return correctWrong;
  }
}



class Worddetail {
  String eng;
  String chn;
  String pronounce;

  Worddetail(String e, String c, String p) {
    eng = e;
    chn = c;
    pronounce = p;
  }

  List<String> getDetail(){
    return [eng,pronounce,chn];
  }

} //do record


class Q{
  String ques;
  String ans;
  String choiceA;
  String choiceB;
  String choiceC;
  String choiceD;
  String explanation;
  bool correctWrong = false;

  Q(String q, String an, String A, String B, String C, String D, String exp) {
  ques = q;
  ans = an;
  choiceA = A;
  choiceB = B;
  choiceC = C;
  choiceD = D;
  explanation = exp;
  }
  void setCorrectWrong(key) {
    correctWrong = key;
  }
  bool getCorrectWrong() {
    return correctWrong;
  }

}

