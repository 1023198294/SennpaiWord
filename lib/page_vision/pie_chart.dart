import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:flutter_app/userinfo/user_info.dart';
import 'package:flutter_app/userinfo/user_info_data.dart';
import 'indicator.dart';

class PieChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex;
  bool _up = false;
  dynamic visualInfo;
  @override
  Widget build(BuildContext context) {
    if (_up == false){
      DataUtils.getVisualRecord(
        {},
        userInfoData.transdata.userid,
      ).then((visualRes){
        setState(() {
          //        print(wordInfoResult);
          visualInfo = visualRes;
          print(visualInfo);
          _up = true;
        });
      });
      return new AspectRatio(aspectRatio: 1.3);
    }

    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color:  Color(0xff232d37),
        child: Stack(
          children: <Widget>[
            Text(
                ' 单词熟练度',
              style: new TextStyle(fontSize: 14, color: Colors.white),
            ),
            Row(
              children: <Widget>[
                const SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                          pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                            setState(() {
                              if (pieTouchResponse.touchInput is FlLongPressEnd ||
                                  pieTouchResponse.touchInput is FlPanEnd) {
                                touchedIndex = -1;
                              } else {
                                touchedIndex = pieTouchResponse.touchedSectionIndex;
                              }
                            });
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections()),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Indicator(
                      color: Color(0xff0293ee),
                      text: '0',
                      textColor: Colors.white,
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Color(0xfff8b250),
                      text: ('1'),
                      textColor: Colors.white,
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Color(0xff845bef),
                      text: '2',
                      textColor: Colors.white,
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Color(0xff13d38e),
                      text: '3',
                      textColor: Colors.white,
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 28,
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    var summ = (visualInfo['proficiencyInfo'][6][0]+visualInfo['proficiencyInfo'][6][1]+
        visualInfo['proficiencyInfo'][6][2]+visualInfo['proficiencyInfo'][6][3]);
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: visualInfo['proficiencyInfo'][6][0]/summ,
            title: (visualInfo['proficiencyInfo'][6][0]/summ*100).round().toString()+'%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: visualInfo['proficiencyInfo'][6][1]/summ,
            title: (visualInfo['proficiencyInfo'][6][1]/summ*100).round().toString()+'%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: visualInfo['proficiencyInfo'][6][2]/summ,
            title: (visualInfo['proficiencyInfo'][6][2]/summ*100).round().toString()+'%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: visualInfo['proficiencyInfo'][6][3]/summ,
            title: (visualInfo['proficiencyInfo'][6][3]/summ*100).round().toString()+'%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}