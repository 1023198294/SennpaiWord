import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';

class CorrectWrongOverlay extends StatefulWidget {
  final bool _isCorrect;
  final QuizBrain _quizBrain;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect,this._quizBrain, this._onTap );

  @override
  State createState() => new CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {

  Animation<double> _iconAnimation;
  Animation<double> _iconAnimation1;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(duration: new Duration(seconds: 1), vsync: this);
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimation1 = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation1.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tmp = widget._quizBrain.getWord(widget._quizBrain.getQInfoWid()).getDetail();

    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child:
        new BlurRectWidget(
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Transform.translate(
                offset: Offset(0,-_iconAnimation1.value*450),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: new Transform.rotate(
                        angle: _iconAnimation.value * 2 * pi,
                        child: new Icon(widget._isCorrect == true ? Icons.done : Icons.clear, size: _iconAnimation.value * 80.0,),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(bottom: 2.0),
                    ),
                    new Text(widget._isCorrect == true ? "Correct!" : "Wrong!", style: new TextStyle(color: Colors.white, fontSize: 30.0),)
                  ],
                ),
              ),
              new Transform.translate(
                offset: Offset(0,-_iconAnimation1.value*150),
                child: new Column(
                  children: <Widget>[
                    new Text('\n\n\n'+ tmp[0]+'   '+ tmp[1] +'\n' , style: new TextStyle(color: Colors.white, fontSize: 20.0),),
//                    new Text(tmp[1] +'\n' , style: new TextStyle(color: Colors.white, fontSize: 16.0),),
                    new Text(tmp[2] , style: new TextStyle(color: Colors.white, fontSize: 16.0),)
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlurRectWidget extends StatelessWidget {
  final Widget _widget;
  double _padding = 10;

  BlurRectWidget(this._widget, {double padding = 0}) {
    if (padding != 0) this._padding = padding;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 8,
          ),
          child: Container(
            color: Colors.white10,
            padding: EdgeInsets.all(_padding),
            child: _widget,
          ),
        ),
      ),
    );
  }
}
