import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page4/change_info.dart';
import 'package:flutter_app/userinfo/user_info_data.dart';
import 'package:share/share.dart';
import 'package:flutter_app/page4/feedback.dart';
import 'package:flutter_app/page4/select_list.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyPageWidgetState();
  }
}

class MyPageWidgetState extends State<MyPageWidget>{
  String username;
  String useremail;
  bool hasVar=false;
  var pic;
  var base642pic;
  var _imgPath;
  ImageProvider<dynamic> defaultpic = NetworkImage(
      'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1575981417&di=654891dd70bee883c0f3c499f186582c&src=http://pic4.zhimg.com/50/v2-882fb1a465545c31301b9e7f9dfa9fc7_r.jpg'
  );
  @override
  void initState() {
    DataUtils.base642Image(userInfoData.transdata.avatarpic).then((res){
      setState(() {
        base642pic = res;
        //print(res);
      });
    });
    DataUtils.checkLogin().then((res)
    {
      if(hasVar){
        setState(() {
          pic = base642pic;
          print('Have pic already');
          print('avat: '+userInfoData.transdata.avatarpic);
        });
      }else
      if (res && userInfoData.transdata.avatarpic != '0')
        {
          setState(() {
            pic = base642pic;
            hasVar = true;
            print('has no default pic');
          });
        }else{
       setState(() {
         pic =  defaultpic;
         hasVar = false;
         print('default pic');
       });
      }
    });
    super.initState();
  }
  _openGallery() async{
    var image = await ImagePicker.pickImage(source:ImageSource.gallery);
    setState(() {
      _imgPath = image;
      pic = FileImage(_imgPath);
      hasVar = true;
    });
    DataUtils.image2Base64(_imgPath).then((res){
      setState(() {
        userInfoData.transdata.avatarpic = res;
        print(userInfoData.transdata.avatarpic);
      });
    });
    DataUtils.postUserInfo(userInfoData.transdata.userid).then((res){
      print('upload done');
    });

  }
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
              accountName: Text(userInfoData.transdata.username),
              accountEmail: Container(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  userInfoData.transdata.email
                  ,style: TextStyle(fontSize: 28),
                ),
              ),
              decoration: BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image:pic == null ?
                  NetworkImage(
                      'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1575981417&di=654891dd70bee883c0f3c499f186582c&src=http://pic4.zhimg.com/50/v2-882fb1a465545c31301b9e7f9dfa9fc7_r.jpg'
                  ):pic
                  ,
                  //image:pic,
                ),
              ),
              onDetailsPressed:()=> {
                showDialog(
                    context: context,
                    builder: (_) => SimpleDialog(
                      title: Text(' '),
                      titlePadding: EdgeInsets.all(1),
                      backgroundColor: Colors.white,
                      elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      children: <Widget>[
                        RaisedButton(
                          onPressed: _openGallery,
                          child: Text('更换头像'),
                          color: Colors.white,
                        )
                      ],
                    )
                ),
              }
            ),

            /*ListTile(
              leading: Icon(
                Icons.border_color,
                size:27.0,
              ),
              title: Text(
                  '词表选择'
              ),
              onTap: (){
                print('词表选择');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>SelectListPage()));
                },
            ),
            new Divider(),*/
            ListTile(
              leading: Icon(
                Icons.build,
                size:27.0,
              ),
              title: Text(
                  '修改信息'
              ),
              onTap: (){
                print('修改信息');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ChangeInfoPage()));
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
                  '检查更新'
              ),
              onTap: (){
                Fluttertoast.showToast(msg: '当前已是最新版本,无需更新');
                print('检查更新');
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