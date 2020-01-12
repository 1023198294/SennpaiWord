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
    if (_up == false || visualInfo == null ){
      DataUtils.getVisualRecord(
        {},
        userInfoData.transdata.userid,
      ).then((visualRes){
        setState(() {
          print(visualRes);
          visualInfo = visualRes;
          var value = 0.0;
          if (visualInfo != visualInfo.toString()){
            for (int i = 0; i <= 23; ++i){
              value += visualInfo['Ahour'][i];
              if ((i+1) % 4 == 0){
                tmp[(i+1)~/4-1]= value;
                value = 0;
              }
            }

          }
          print(tmp);
          _up = true;
        });
      });
      return new AspectRatio(aspectRatio: 1.3);
    }
    if (visualInfo == visualInfo.toString()){
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
                        barRods: [BarChartRodData(y: tmp[0]+0.1, color: Color(0xffaec8ca))],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 1,
                        barRods: [BarChartRodData(y: tmp[1]+0.1, color:Color(0xffaec8ca))],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 2,
                        barRods: [BarChartRodData(y: tmp[2]+0.1, color:Color(0xffaec8ca))],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 3,
                        barRods: [BarChartRodData(y: tmp[3]+0.1, color:Color(0xffaec8ca))],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 3,
                        barRods: [BarChartRodData(y: tmp[4]+0.1, color: Color(0xffaec8ca))],
                        showingTooltipIndicators: [0]),
                    BarChartGroupData(
                        x: 3,
                        barRods: [BarChartRodData(y: tmp[5]+0.1, color: Color(0xffaec8ca))],
                        showingTooltipIndicators: [0]),
                  ]),
            ),
          ],
        )


      ),
    );
  }
}




class LineChartSample3 extends StatefulWidget {
  @override
  _LineChartSample3State createState() => _LineChartSample3State();
}

class _LineChartSample3State extends State<LineChartSample3> {
  int month =  new DateTime.now().month;
  int day = new DateTime.now().weekday;

  List<Color> gradientColors = [
    const Color(0xffd28a7c),
    const Color(0xffaec8ca),

  ];
  bool showAvg = false;
  bool _up = false;
  dynamic visualInfo;
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.50,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                color: const Color(0xff232d37)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 15.0, left: 9.0, top: 20, bottom: 8),
              child: LineChart(
                showAvg ? mainData() : mainData(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: FlatButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              '遗忘曲线',
              style: TextStyle(
                  fontSize: 10,
                  color:
                  showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {


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
      return new LineChartData();
    }
    if (visualInfo == visualInfo.toString()) {
      return new LineChartData();
    }

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
              color: const Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '今天';
              case 1:
                return '明天';
              case 2:
                return '后天';
              case 3:
                return '3天后';
              case 4:
                return '4天后';
              case 5:
                return '5天后';
              case 6:
                return '6天后';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 20:
                return '20';
              case 40:
                return '40';
            }
            return '';
          },
          reservedSize: 28,
          margin: 10,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 60,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, visualInfo['Forgetting curve'][0]),
            FlSpot(1, visualInfo['Forgetting curve'][1]),
            FlSpot(2, visualInfo['Forgetting curve'][2]),
            FlSpot(3, visualInfo['Forgetting curve'][3]),
            FlSpot(4, visualInfo['Forgetting curve'][4]),
            FlSpot(5, visualInfo['Forgetting curve'][5]),
            FlSpot(6, visualInfo['Forgetting curve'][6]),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
            gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    var avg = (visualInfo['active time'][6]+visualInfo['active time'][1]+
        visualInfo['active time'][2]+visualInfo['active time'][3]+visualInfo['active time'][4]+
        visualInfo['active time'][5]+visualInfo['active time'][6])/7;
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
              color: const Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '今天';
              case 1:
                return '明天';
              case 2:
                return '后天';
              case 3:
                return '3天后';
              case 4:
                return '4天后';
              case 5:
                return '5天后';
              case 6:
                return '6天后';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 20:
                return '20';
              case 40:
                return '40';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 60,
      lineBarsData: [
        LineChartBarData(
          spots:  [
            FlSpot(0, avg),
            FlSpot(1, avg),
            FlSpot(2, avg),
            FlSpot(3, avg),
            FlSpot(4, avg),
            FlSpot(5, avg),
            FlSpot(6, avg),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}