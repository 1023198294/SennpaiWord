import 'package:flutter/material.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'page_record/quiz.dart';
import 'package:flutter_app/userinfo/user_info.dart';
import 'package:flutter_app/userinfo/user_info_data.dart';

class RecordPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new RecordPageWidgetState();
  }
}

class RecordPageWidgetState extends State<RecordPageWidget>{
  Quiz quiz;
  List<WordsRecord> results = records;
  Color c;
  var info = userInfoData.transdata;
  dynamic _recordList;

  @override
  Widget build(BuildContext context) {
    DataUtils.getPlanRecord({},info.userid).then((planRecordResult){
//      print('here');
//      setState(() {
        _recordList = planRecordResult;
//      });
      print(_recordList.length);
      print('get reocrd list ok');
    }
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('词库'),
        backgroundColor: Colors.white,
      ),
      body: new Center(
        child: ListView(
          children: <Widget> [
            ListTile(
              leading: Icon(
                Icons.star,
                size: 27.0,
              ),
              title: Text(
                  '收藏夹'
              ),
              onTap: (){
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => questionList()),
                );
              },
            ),
            new Divider(),
            ListTile(
              leading: Icon(
                Icons.book,
                size:27.0,
              ),
              title: Text(
                  '当前词库'
              ),
              onTap: (){
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => questionList()),
                );
              },
            ),
          ],
        ),
//        questionList(),
      ),
    );
  }




  Widget questionList() {
    return new Scaffold(
      appBar: AppBar(
        title: Text(userInfoData.transdata.plan),
      ),
      body: ListView.builder(
//        itemCount: results.length,
        itemCount: _recordList.length,
        itemBuilder: (context, index) => Card(
          color: Colors.white,
          elevation: 0.0,
          child: ExpansionTile(
            trailing: Icon(Icons.expand_more, color: Colors.white,),
            title: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top:12),
                      child: Text(
                        _recordList[index][2],
//                        results[index].word,
                        textAlign:TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            width: 100.0,
                          ),
                          FilterChip(
                            backgroundColor: Colors.grey[100],
                            label: Text(
                              _recordList[index][4].toString()
//                              results[index].proficiency,
                            ),
//                            onPressed: () => {},
                            onSelected: (b) {},
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
//          leading: CircleAvatar(
//            backgroundColor: Colors.grey[100],
//            child: Text(results[index].word.startsWith("g") ? "G" : "B"),
//          ),
//            children:[AnswerWidget(results[index].wordInfo),],
            children:[AnswerWidget(_recordList[index][3][0]),],

          ),
        ),
      ),
    );
  }

}

//{
//"result":[(
//"TID",
//"WID",
//"Proficiency"
//)]
//}


class AnswerWidget extends StatefulWidget {

  final String m;

  AnswerWidget(this.m);

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  Color c = Colors.black;
  @override
  Widget build(BuildContext context) {
    return ListTile(
//      onTap: () {
////        setState(() {
////          if (widget.m == widget.results[widget.index].correctAnswer) {
////            c = Colors.green;
////          } else {
////            c = Colors.red;
////          }
////        });
////      },
      title: Text(
        widget.m,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: c,
          fontSize: 14,
        ),
      ),
    );
  }
}
