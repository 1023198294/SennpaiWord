
import 'package:flutter/material.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Q> _questionBank = [
    Q('good', '好的','好的','猫','8','电','good   adj.  好\n\nDalao is a good person.\n'),
    Q('bad', '坏的','好的','坏的','8','电','bad   adj.  坏\n\nDalao is not a bad person.\n'),
  ];

  void insertQuestionBank() {
  }


  int getQuestionNumber() {
    return _questionNumber;
  }
   List<Q> getQuestionBank() {
    return _questionBank;
   }

  void nextQuestion() {
    print('!!!');
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
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
  //TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
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

