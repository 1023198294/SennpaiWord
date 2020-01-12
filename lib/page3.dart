import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'page_vision/pie_chart.dart';
import 'page_vision/bar_chart.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:flutter_app/userinfo/user_info.dart';
import 'package:flutter_app/userinfo/user_info_data.dart';
class VisualizeWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new VisualizeWidgetState();
  }
}


class VisualizeWidgetState extends State<VisualizeWidget>{


  @override
  void initState(){

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('学习统计'),
        backgroundColor: Colors.white,
      ),
      body: new Center(
        child: Container(
          decoration: new BoxDecoration(
            color:Colors.white,
//            gradient: new LinearGradient(
//              begin: Alignment.centerLeft,
//              end: new Alignment(1.0, 1.0), // 10% of the width, so there are ten blinds.
//              colors: [Color(0xFF635554), Color(0xFF635554)], // whitish to gray
//              tileMode: TileMode.repeated, // repeats the gradient over the canvas
//            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: new Swiper(
              layout: SwiperLayout.CUSTOM,
              customLayoutOption: new CustomLayoutOption(
                  startIndex: -1,
                  stateCount: 3
              ).addRotate([
                15.0/180,
                0.0,
                -15.0/180
              ]).addTranslate([
                new Offset(-370.0, -40.0),
                new Offset(0.0, 0.0),
                new Offset(370.0, -40.0)
              ]),
              itemWidth: 300.0,
              itemHeight: 300.0,
              itemBuilder: (context, index) {
//                return new Image.network(imgs[index],fit: BoxFit.cover,);
                return new Center(child:imgs[index]);

              },
              itemCount: imgs.length),
        ),
//        ListView(
//          children: <Widget>[
//            LineChartSample2(),
//            PieChartSample2(),
//            BarChartSample3(),
//          ],
//        ),
      ),
    );
  }
}
List <dynamic> imgs=[LineChartSample2(),PieChartSample2(),BarChartSample3(),LineChartSample3()];

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  int month =  new DateTime.now().month;
  int day = new DateTime.now().weekday;

  List<Color> gradientColors = [
    const Color(0xffaec8ca),
    const Color(0xffd28a7c),
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
                showAvg ? avgData() : mainData(),
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
              '活跃时间',
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
                return '6天前';
              case 1:
                return '5天前';
              case 2:
                return '4天前';
              case 3:
                return '3天前';
              case 4:
                return '前天';
              case 5:
                return '昨天';
              case 6:
                return '今天';
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
            FlSpot(0, visualInfo['active time'][0]),
            FlSpot(1, visualInfo['active time'][1]),
            FlSpot(2, visualInfo['active time'][2]),
            FlSpot(3, visualInfo['active time'][3]),
            FlSpot(4, visualInfo['active time'][4]),
            FlSpot(5, visualInfo['active time'][5]),
            FlSpot(6, visualInfo['active time'][6]),
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
                return '6天前';
              case 1:
                return '5天前';
              case 2:
                return '4天前';
              case 3:
                return '3天前';
              case 4:
                return '前天';
              case 5:
                return '昨天';
              case 6:
                return '今天';
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