import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:flutter_app/userinfo/user_info.dart';
import 'package:flutter_app/userinfo/user_info_data.dart';
class BarChartSample3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  bool _up = false;
  dynamic visualInfo;
  List<double> tmp = new List(6);
  @override
  Widget build(BuildContext context) {
    if (_up == false || visualInfo == null){
      DataUtils.getVisualRecord(
        {},
        userInfoData.transdata.userid,
      ).then((visualRes){
        setState(() {
          //        print(wordInfoResult);
          visualInfo = visualRes;
          print(visualInfo);
          var value = 0.0;
          for (int i = 0; i <= 23; ++i){
            value += visualInfo['Ahour'][i];
            if ((i+1) % 4 == 0){
              tmp[(i+1)~/4-1]= value;
              value = 0;
            }
          }
          print(tmp);
          _up = true;
        });
      });
      return new AspectRatio(aspectRatio: 1.3);
    }


    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xff232d37),
        child: Stack(
          children: <Widget>[
            Text(
              ' 近1周日均活跃度（分钟）',
              style: new TextStyle( fontSize: 14, color: Colors.white),
            ),
            BarChart(
              BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 48,
                  barTouchData: BarTouchData(
                    enabled: false,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.transparent,
                      tooltipPadding: const EdgeInsets.all(0),
                      tooltipBottomMargin: 6,
                      getTooltipItem: (
                          BarChartGroupData group,
                          int groupIndex,
                          BarChartRodData rod,
                          int rodIndex,
                          ) {
                        return BarTooltipItem(
                          rod.y.round().toString(),
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      textStyle: TextStyle(
                          color: const Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                      margin: 20,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return '0-3';
                          case 1:
                            return '4-7';
                          case 2:
                            return '8-11';
                          case 3:
                            return '12-15';
                          case 4:
                            return '16-19';
                          case 5:
                            return '20-23';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: const SideTitles(showTitles: false),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: [
                    BarChartGroupData(
                        x: 0,
                        barRods: [BarChartRodData(y: tmp[0]+0.1, color: Colors.lightBlueAccent)],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 1,
                        barRods: [BarChartRodData(y: tmp[1]+0.1, color: Colors.lightBlueAccent)],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 2,
                        barRods: [BarChartRodData(y: tmp[2]+0.1, color: Colors.lightBlueAccent)],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 3,
                        barRods: [BarChartRodData(y: tmp[3]+0.1, color: Colors.lightBlueAccent)],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 3,
                        barRods: [BarChartRodData(y: tmp[4]+0.1, color: Colors.lightBlueAccent)],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 3,
                        barRods: [BarChartRodData(y: tmp[5]+0.1, color: Colors.lightBlueAccent)],
                        showingTooltipIndicators: [0]),
                  ]),
            ),
          ],
        )


      ),
    );
  }
}