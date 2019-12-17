import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'second_page.dart';

class LoginScreen2 extends StatelessWidget {
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color highlightColor;
  final Color foregroundColor;
  final AssetImage logo;

  LoginScreen2({Key k, this.backgroundColor1, this.backgroundColor2, this.highlightColor, this.foregroundColor, this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: new Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
          colors: [this.backgroundColor1, this.backgroundColor2], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
            child: Center(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: new Text(
                      "今日新词",
                      style: TextStyle(color: this.foregroundColor),
                    ),
                  ),
                  Container(
                    height: 144.0,
                    width: 144.0,
                    child: LiquidCircularProgressIndicator(
                      value: 50/60, //当前进度 0-1
                      valueColor: AlwaysStoppedAnimation(Colors.grey[50]), // 进度值的颜色.
                      backgroundColor: this.backgroundColor1, // 背景颜色.
                      borderColor: this.backgroundColor1,//边框颜色
                      borderWidth: 3.0,
                      direction: Axis.vertical,
                      center: Text(
                        "50",
                        style: TextStyle(fontSize: 48,color: this.backgroundColor2),
                      ),
                    ),
//                    child: new CircleAvatar(
//                      backgroundColor: Colors.transparent,
//                      foregroundColor: this.foregroundColor,
//                      radius: 100.0,
//                      child: new Text(
//                        "60",
//                        style: TextStyle(
//                          fontSize: 50.0,
//                          fontWeight: FontWeight.w100,
//                        ),
//                      ),
//                    ),
//                    decoration: BoxDecoration(
//                        border: Border.all(
//                          color: this.foregroundColor,
//                          width: 1.0,
//                        ),
//                        shape: BoxShape.circle,
//                        //image: DecorationImage(image: this.logo)
//                      ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      "今日需复习 10",
                      style: TextStyle(color: this.foregroundColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
//          Divider(height:5.0,indent:10.0,color: Colors.white70,),
          new CustomPaintRoute(),

          new Padding(
            padding: const EdgeInsets.fromLTRB(36,8,36,8),
            child: Row(
//              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: new Column(
                        children: <Widget>[
                          new Text(
                            "单词计划",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: this.foregroundColor),
                          ),
                          new Text(
                            "CET4 60/天",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: this.foregroundColor),
                          ),
                        ]
                    ),
                  ),
                  flex: 2,
                ),
//                Expanded(
//                  child: Container(
//                    padding: EdgeInsets.all(5.0),
//                  ),
//                  flex: 1,
//                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: new Column(
                        children: <Widget>[
                          new Text(
                            "128/526",
                            textAlign: TextAlign.right,

                            style: TextStyle(fontSize: 18, color: this.foregroundColor),
                          ),
                        ]
                    ),
                  ),
                  flex: 2,
                ),
              ],
            ),
          ),

          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new LinearPercentIndicator(
                  width: 280,
                  lineHeight: 12.0,
                  percent: 128/526,
                  backgroundColor: this.backgroundColor2,
                  progressColor: Colors.grey[50],
                ),

              ],
            ),
          ),

          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 60.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 18.0),
                    color: this.backgroundColor2,
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => new SecondScreen()),
                      );
                    },
                    child: Text(
                      "开始学习",
                      style: TextStyle(fontSize: 18, color: this.foregroundColor),
                    ),
                  ),
                ),
              ],
            ),
          ),

          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    color: Colors.transparent,
                    onPressed: () => {},
                    child: Text(
                      "单词列表(optional)",
                      style: TextStyle(color: this.foregroundColor.withOpacity(0.5)),
                    ),
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}

class CustomPaintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(280, 2), //指定画布大小
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint();

    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.white70
      ..strokeWidth = 1.0;
    canvas.drawLine(Offset(0, 0), Offset(size.width, 0), paint);


  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Second Screen"),
//      ),
      body:
      Container(
        child: Quizzler(),
      ),
//      new Center(
//        child: new RaisedButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: new Text('Go back!'),
//        ),
//      ),
    );
  }
}