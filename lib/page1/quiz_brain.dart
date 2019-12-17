
import 'package:flutter/material.dart';

class QuizBrain {
  int _questionNumber = 0;
//
//  List<Question> _questionBank = [
//    Question('Some cats are actually allergic to humans', true),
//    Question('You can lead a cow down stairs but not up stairs.', false),
//    Question('Approximately one quarter of human bones are in the feet.', true),
//    Question('A slug\'s blood is green.', true),
//    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
//    Question('It is illegal to pee in the Ocean in Portugal.', true),
//    Question(
//        'No piece of square dry paper can be folded in half more than 7 times.',
//        false),
//    Question(
//        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
//        true),
//    Question(
//        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
//        false),
//    Question(
//        'The total surface area of two human lungs is approximately 70 square metres.',
//        true),
//    Question('Google was originally called \"Backrub\".', true),
//    Question(
//        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
//        true),
//    Question(
//        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
//        true),
//  ];
  List<Q> _questionBank = [
    Q('good', '好的','好的','猫','8','电'),
    Q('bad', '坏的','好的','坏的','8','电'),
  ];
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
  bool correctWrong = false;

  Q(String q, String an, String A, String B, String C, String D) {
  ques = q;
  ans = an;
  choiceA = A;
  choiceB = B;
  choiceC = C;
  choiceD = D;
  }
  void setCorrectWrong(key) {
    correctWrong = key;
  }
  bool getCorrectWrong() {
    return correctWrong;
  }

}

