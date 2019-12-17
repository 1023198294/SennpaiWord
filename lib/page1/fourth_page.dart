import 'package:flutter/material.dart';
import '../main.dart';
class ScorePage extends StatelessWidget {

  int score = 0;
  int totalQuestions = 0;

  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.blueGrey,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Finished!", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),),
//            new Text(score.toString() + "/" + totalQuestions.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),
            new IconButton(
                icon: new Icon(Icons.arrow_right),
                color: Colors.white,
                iconSize: 50.0,
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new MyApp()), (Route route) => route == null)
            )
          ],
        )
    );
  }
}