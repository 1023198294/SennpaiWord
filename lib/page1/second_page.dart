import 'package:flutter/material.dart';
//TODO: Step 2 - Import the rFlutter_Alert package here.
import 'fourth_page.dart';
import 'quiz_brain.dart';
import 'package:flutter/cupertino.dart';
import 'third_page.dart';
import '../main.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:flutter_app/userinfo/user_info.dart';
import 'package:flutter_app/userinfo/user_info_data.dart';
import 'dart:convert';
//QuizBrain quizBrain = QuizBrain();
class Quizzler extends StatelessWidget {

  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      home: Container(
        decoration: new BoxDecoration(
          color: Color(0xFF444152),
//          gradient: new LinearGradient(
//            begin: Alignment.centerLeft,
//            end: new Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
//            colors: [Color(0xFF444152), Color(0xFF6f6c7d)], // whitish to gray
//            tileMode: TileMode.repeated, // repeats the gradient over the canvas
//          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: QuizPage(pageContext: context,),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  BuildContext pageContext;
  QuizPage({this.pageContext});

  @override
  _QuizPageState createState() => _QuizPageState(pageContext: pageContext);
}

class _QuizPageState extends State<QuizPage> {
  var info = userInfoData.transdata;
  var _updated = false;
  String starttime;
  String endtime;


  Worddetail qWord;
  Worddetail qOpt1;
  Worddetail qOpt2;
  Worddetail qOpt3;
  Worddetail qOpt4;
  dynamic opts;

  List<Icon> scoreKeeper = [];
  bool overlayShouldBeVisible = false;
  bool isCorrect;
  BuildContext pageContext;
  _QuizPageState({this.pageContext});
  @override
  void initState() {
    starttime =  new DateTime.now().toString();
    starttime = starttime.replaceRange(10, 11, '-');
    starttime = starttime.replaceAll(':','-');
    starttime = starttime.substring(0,19);


    super.initState();
  }

  void checkingAnswer(String A) {
    String Q = userInfoData.quizBrain.getQInfoWid();

    this.setState(() {
      overlayShouldBeVisible = true;
      if (Q == A) {
        isCorrect = true;
      } else {
        isCorrect = false;
      }
      userInfoData.quizBrain.getQInfo().setCorrectWrong(isCorrect);
    });
  }


  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = userInfoData.quizBrain.getCorrectAnswer();

    this.setState(() {
      overlayShouldBeVisible = true;
      if (userPickedAnswer == correctAnswer) {
        isCorrect = true;
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        isCorrect = false;
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_updated == false || userInfoData.quizBrain.getLength() == 0){
      DataUtils.getWordList(
        {},
      ).then((wordListResult){
        setState(() {
          userInfoData.quizBrain.createQInfoBank(wordListResult);
          print('create quiz info bank ok');
          print(wordListResult);
          _updated = true;
        });
      });
      return new Container();
    }
    qWord = userInfoData.quizBrain.getWord(userInfoData.quizBrain.getQInfoWid());
    opts = userInfoData.quizBrain.getQInfoOpt();
    qOpt1 = userInfoData.quizBrain.getWord(opts[0]);
    qOpt2 = userInfoData.quizBrain.getWord(opts[1]);
    qOpt3 = userInfoData.quizBrain.getWord(opts[2]);
    qOpt4 = userInfoData.quizBrain.getWord(opts[3]);


    return new Stack(
      fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new FavoriteWidget(), //todo: each expand
              Expanded(
                flex: 12,
                child: Padding(
                  padding:  EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,),
                  child: Center(
                    child: Text(
                      qWord.eng,
//                      qWord["English"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:  EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,),
                  child: FlatButton(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    textColor: Colors.white,
                    color: Colors.grey[50],
                    child: Text(
                      cutString(qOpt1.chn),
//                      qOpt1['Chinese'][0],
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () {
                      //The user picked true.
//                      checkAnswer(ABCD[0]);
                      checkingAnswer(opts[0]);
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:  EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,),
                  child: FlatButton(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    color: Colors.grey[50],
                    child: Text(
                      cutString(qOpt2.chn),
//                      qOpt2['Chinese'][0],
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                      ),
                    ),
                    onPressed: () {
                      //The user picked false.
//                      checkAnswer(ABCD[1]);
                      checkingAnswer(opts[1]);
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:  EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,),
                  child: FlatButton(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    textColor: Colors.white,
                    color: Colors.grey[50],
                    child: Text(
                      cutString(qOpt3.chn),
//                      qOpt3['Chinese'][0],
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () {
                      //The user picked true.
//                      checkAnswer(ABCD[2]);
                      checkingAnswer(opts[2]);
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:  EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,),
                  child: FlatButton(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    color: Colors.grey[50],
                    child: Text(
                      cutString(qOpt4.chn),
//                      qOpt4['Chinese'][0],
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                      ),
                    ),
                    onPressed: () {
                      //The user picked false.
//                      checkAnswer(ABCD[3]);
                      checkingAnswer(opts[3]);
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:  EdgeInsets.all(0),
                ),
              ),
//              Row(
//                children: scoreKeeper,
//              )
            ],
          ),
          overlayShouldBeVisible == true ? new CorrectWrongOverlay(
              isCorrect,userInfoData.quizBrain, //todo: chage to qword
                  () {
                    if (isCorrect)
                      userInfoData.quizBrain.getQInfo().proficiency++;
                    else if(userInfoData.quizBrain.getQInfo().proficiency==0)
                      userInfoData.quizBrain.getQInfo().proficiency = 1;

                    if (userInfoData.quizBrain.getQInfo().proficiency >= 3)
                      userInfoData.quizBrain.getQInfo().proficiency = 3;

                    Qinfo ttmp = userInfoData.quizBrain.getQInfo();
                    userInfoData.quizBrain.updateLnR();
                    DataUtils.postPlanRecord(
                      {
                        'data':{
                          'result':[
                            [
                              ttmp.tid,
                              ttmp.wid,
                              ttmp.proficiency,
                            ]
                          ]
                        }

                      },
                      info.userid,
                    ).then((postResult){
                      print(postResult);
                      print('post plan record ok');
                    });


                if (userInfoData.quizBrain.isFinished()) {
                  _updated = false;
                  endtime =  new DateTime.now().toString();
                  endtime = endtime.replaceRange(10, 11, '-');
                  endtime = endtime.replaceAll(':','-');
                  endtime = endtime.substring(0,19);

                  print({
                    "count_learned":userInfoData.quizBrain.getLearnNum(),
                    "count_reviewed":userInfoData.quizBrain.getReviewNum(),
                    "start":starttime,
                    "end":endtime,
                  });

                  DataUtils.postRecord(
                    {
                      'data':{
                        "count_learned":userInfoData.quizBrain.getLearnNum(),
                        "count_reviewed":userInfoData.quizBrain.getReviewNum(),
                        "start":starttime,
                        "end":endtime,
                      }
                    },
                    info.userid,
                  ).then((postRecordResult){
                    print(postRecordResult);
                    print('post record ok');
                  });

                  userInfoData.quizBrain.reset();

                  Navigator.push(
                      context,
                      new MaterialPageRoute(builder:
                      (BuildContext context) => new ScorePage(pageContext:pageContext)),//todo:
                      );
                  return;
                }
                userInfoData.quizBrain.nextQInfo();

                this.setState(() {
                  overlayShouldBeVisible = false;
                });
              }
          ) : new Container()
        ],
    );
  }
}




//------------------star-------------------
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      // If the lake is currently favorited, unfavorite it.
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_isFavorited
                ? new Icon(Icons.star)
                : new Icon(Icons.star_border)),
            color: Colors.grey[50],
            onPressed: _toggleFavorite,
          ),
        ),
//        new SizedBox(
//          width: 18.0,
//          child: new Container(
//            child: new Text('$_favoriteCount'),
//          ),
//        ),
      ],
    );
  }
}

String cutString(String str) {
  if (str.length > 20)
    str=str.substring(0,20)+'...';
  return str;
}
