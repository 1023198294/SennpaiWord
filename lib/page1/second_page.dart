import 'package:flutter/material.dart';
//TODO: Step 2 - Import the rFlutter_Alert package here.
import 'fourth_page.dart';
import 'quiz_brain.dart';
import 'package:flutter/cupertino.dart';
import 'third_page.dart';
import '../main.dart';
QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.centerLeft,
            end: new Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
            colors: [Color(0xFF444152), Color(0xFF6f6c7d)], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
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
  List<Icon> scoreKeeper = [];
  bool overlayShouldBeVisible = false;
  bool isCorrect;
  BuildContext pageContext;
  _QuizPageState({this.pageContext});
  @override
  void initState() {
    super.initState();
  }

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();

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
    List<String> ABCD = quizBrain.getABCD();
    return new Stack(
      fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new FavoriteWidget(),
              Expanded(
                flex: 12,
                child: Padding(
                  padding:  EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,),
                  child: Center(
                    child: Text(
                      quizBrain.getQuestionText(),
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
                      ABCD[0],
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      //The user picked true.
                      checkAnswer(ABCD[0]);
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
                      ABCD[1],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                      ),
                    ),
                    onPressed: () {
                      //The user picked false.
                      checkAnswer(ABCD[1]);
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
                      ABCD[2],
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      //The user picked true.
                      checkAnswer(ABCD[2]);
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
                      ABCD[3],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                      ),
                    ),
                    onPressed: () {
                      //The user picked false.
                      checkAnswer(ABCD[3]);
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
              isCorrect,
                  () {
                if (quizBrain.isFinished()) {
                  quizBrain.reset();

                  Navigator.push(
                      context,
                      new MaterialPageRoute(builder:
                      (BuildContext context) => new ScorePage(pageContext:pageContext)),//todo:
                      );
                  return;
                }
                quizBrain.nextQuestion();

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

