import 'package:flutter/material.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'second_page.dart';
import 'package:flutter_app/userinfo/user_info.dart';
import 'package:flutter_app/userinfo/user_info_data.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return new _FirstPageState();
  }
}

class _FirstPageState extends State<LoginScreen2> {
  final Color backgroundColor1=Color(0xFF444152);
  final Color backgroundColor2=Color(0xFF6f6c7d);
  final Color foregroundColor=Colors.white;

  var _planList;
  var _Vname='';
  var _totalRecited=0;
  var _remained=996;
  var _todayslearn=1;
  var _todaysreview=0;
  var _continue;
  var _updated;

  var info = userInfoData.transdata;


  @override
  void initState() {

//    DataUtils.getInfoUserOverview(
//      {},
//      info.userid,
//      'overview',
//    ).then((overviewResult){
////      print('here');
//      setState(() {
//        print(overviewResult);
//        _Vname = overviewResult['Vname'];
//        _totalRecited = overviewResult['alreadyRecite'];
//        _remained = overviewResult['remained'];
//        _todayslearn = overviewResult['today learn'];
//        _todaysreview = overviewResult['today review'];
//        _continue = overviewResult['continuous'];
//      });
//    }
//    );
//    DataUtils.getPlanList({},).then((planListResult){
////      print('here');
//      setState(() {
//        _planList = planListResult;
//      });
//      print(_planList);
//      print('get plan list ok');
//    }
//    );
    _updated = false;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    if (_updated == false) {
      DataUtils.getInfoUserOverview(
        {},
        info.userid,
        'overview',
      ).then((overviewResult){
//      print('here');
        setState(() {
          print(overviewResult);
          print('get overview ok');
          _Vname = overviewResult['Vname'];
          _totalRecited = overviewResult['alreadyRecite'];
          _remained = overviewResult['remained'];
          _todayslearn = overviewResult['today learn'];
          _todaysreview = overviewResult['today review'];
          _continue = overviewResult['continuous'];
          userInfoData.transdata.plan = _Vname;
        });
      }
      );

      DataUtils.getPlanList({},).then((planListResult){
//      print('here');
        setState(() {
          _planList = planListResult;
        });
        print(_planList);
        print('get plan list ok');
      }
      );

      _updated = true;
      return new Container(
        decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: new Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
          colors: [this.backgroundColor1, this.backgroundColor2], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
        height: MediaQuery.of(context).size.height,);
    }

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
                      value: _todayslearn/_todayslearn, //当前进度 0-1
                      valueColor: AlwaysStoppedAnimation(Colors.grey[50]), // 进度值的颜色.
                      backgroundColor: this.backgroundColor1, // 背景颜色.
                      borderColor: this.backgroundColor1,//边框颜色
                      borderWidth: 3.0,
                      direction: Axis.vertical,
                      center: Text(
                        (_todayslearn-0).toString(),
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
                      "今日需复习 " + _todaysreview.toString(),
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
                            
                            cutString(_Vname)+' '+_todayslearn.toString()+"/天",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: this.foregroundColor,fontSize: 12),
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
                            _totalRecited.toString()+'/'+(_remained+_totalRecited).toString(),
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
                  percent: _totalRecited/(_remained+_totalRecited),
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
                    onPressed: () => { // ignore: sdk_version_set_literal
                    showDialog(
                      context: context,
                      builder: (_) => SimpleDialog(
                          title: Text("计划选择"),
                          titlePadding: EdgeInsets.all(10),
                          backgroundColor: Colors.white,
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                          children: <Widget>[
                            ListTile(
                              title: Center(child: Text(_planList[0][1].toString()),),
                              onTap: (){
                                DataUtils.postPlan(
                                    {'data':{'Vname':_planList[0][1].toString()}},info.userid
                                ).then((res){
                                  setState(() {
                                    print(res);
                                    _updated = false;
                                    _Vname = _planList[0][1].toString();
                                  });
                                });
//                                Navigator.pop(_);
                              },
                            ),
                            ListTile(
                              title: Center(child: Text(_planList[1][1].toString()),),
                              onTap: (){
                                DataUtils.postPlan(
                                    {'data':{'Vname':_planList[1][1].toString()}},info.userid
                                ).then((res){
                                  setState(() {
                                    print(res);
                                    _updated = false;
                                    _Vname = _planList[1][1].toString();
                                  });
                                });
//                                Navigator.pop(_);
                              },
                            ),
                            ListTile(
                              title: Center(child: Text(_planList[2][1].toString()),),
                              onTap: (){
                                DataUtils.postPlan(
                                    {'data':{'Vname':_planList[2][1].toString()}},info.userid
                                ).then((res){
                                  setState(() {
                                    print(res);
                                    _updated = false;
                                    _Vname = _planList[2][1].toString();
                                  });
                                });
//                                Navigator.pop(_);
                              },

                            ),
                            ListTile(
                              title: Center(child: Text(_planList[3][1].toString()),),
                              onTap: (){
                                DataUtils.postPlan(
                                    {'data':{'Vname':_planList[3][1].toString()}},info.userid
                                ).then((res){
                                  setState(() {
                                    print(res);
                                    _updated = false;
                                    _Vname = _planList[3][1].toString();
                                  });
                                });
//                                Navigator.pop(_);
                              },

                            ),
                            ListTile(
                              title: Center(child: Text("Close"),),
                            onTap: (){
                              Navigator.pop(_);
                            },
                            ),
                          ],
                        )),

                    },
                    child: Text(
                      "计划选择",
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

String cutString(String str) {
  if (str.length > 7)
    str=str.substring(0,7)+'...';
  return str;
}