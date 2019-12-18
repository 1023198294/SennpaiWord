import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter_app/page4/feedback.dart';
class MyPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyPageWidgetState();
  }
}

class MyPageWidgetState extends State<MyPageWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('个人信息'),
        ),
        body: //Center(
        //child: Icon(Icons.mood,size: 130.0,color: Colors.blue,),
        //),
        ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Tadokoro Kouji'),
              accountEmail: Container(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  '1145141919@810.com',style: TextStyle(fontSize: 28),
                ),
              ),
              decoration: BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(
                      'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1575981417&di=654891dd70bee883c0f3c499f186582c&src=http://pic4.zhimg.com/50/v2-882fb1a465545c31301b9e7f9dfa9fc7_r.jpg'
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.border_color,
                size:27.0,
              ),
              title: Text(
                  '词表选择'
              ),
              onTap: (){
                print('词表选择');
              },
            ),
            new Divider(),
            ListTile(
              leading: Icon(
                Icons.account_box,
                size:27.0,
              ),
              title: Text(
                  '我的信息'
              ),
              onTap: (){
                print('我的信息');
              },
            ),
            new Divider(),
            ListTile(
              leading: Icon(
                Icons.record_voice_over,
                size:27.0,
              ),
              title: Text(
                  '意见反馈'
              ),
              onTap: (){
                print('意见反馈');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>FeedBackPage()));
              },
            ),
            new Divider(),
            ListTile(
              leading: Icon(
                Icons.update,
                size:27.0,
              ),
              title: Text(
                  '版本升级'
              ),
              onTap: (){
                print('版本升级');
              },
            ),
            new Divider(),
            ListTile(
              leading: Icon(
                Icons.share,
                size:27.0,
              ),
              title: Text(
                  '分享应用'
              ),
              onTap: (){
                print('分享应用');
                Share.share('www.baidu.com');
              },
            ),
            //sectionB,
            //sectionC,
            //sectionD
          ],
        )
    );
  }
}