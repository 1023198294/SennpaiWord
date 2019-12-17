import 'package:flutter/material.dart';

import 'page_record/quiz.dart';

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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('记录'),
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
                  '已学单词'
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
        title: Text('已学单词'),
      ),
      body: ListView.builder(
        itemCount: results.length,
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
                        results[index].word,
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
                              results[index].proficiency,
                            ),
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
            children:[AnswerWidget(results[index].wordInfo),],
          ),
        ),
      ),
    );
  }

}


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
