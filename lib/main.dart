import 'package:flutter/material.dart';
import 'package:flutter_app/login/login.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title:'欢迎',
      home: new MyHomePage(),
      theme: ThemeData(primaryColor: new Color(0xfff4f4f4)),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new MyHomePageState();
  }
}
class MyHomePageState extends State<MyHomePage>{
  bool _hasLogin = false;
  bool _isLoading = true;
  bool isConnected = false;
  String registrationId;
  @override
  void initState(){
    super.initState();
    //DataUtils.TestLogOut().then((res){}); //仅供测试
    DataUtils.checkLogin().then((haslogin){
      if (haslogin == true){
        setState(() {
          _hasLogin = true;
          _isLoading = false;
          //print('has logged in');
        });
      }else{
        setState(() {
          _hasLogin = false;
          _isLoading = false;
          print('not logged in');
        });
      }
    });
  }
  showWelcomePage(){
    DataUtils.checkLogin().then((res){
      bool haslogin = false;
      if (res) {
        print('already log in');
        haslogin = true;
      }else{
        print('not log in yet');
        haslogin = false;
      }
      setState(() {
        _hasLogin = haslogin;
      });
    });
    if (_hasLogin){
      return BottomNavigationWidget();
      //_hasLogin = true; // 占位
    }else{
      return LoginPage();
    }
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:'主页面',
      home: new Scaffold(body: showWelcomePage()),
      theme: ThemeData(primaryColor: new Color(0xfff4f4f4)),
    );
  }
}

class BottomNavigationWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new BottomNavigationWidgetState();
  }
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  List<Widget> pages = new List();

  @override
//initState是初始化函数，在绘制底部导航控件的时候就把这3个页面添加到list里面用于下面跟随标签导航进行切换显示
  void initState() {
    pages
      ..add(HomePageWidget())
      ..add(RecordPageWidget())
      ..add(VisualizeWidget())
      ..add(MyPageWidget());
    super.initState();
  }
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    /*
    返回一个脚手架，里面包含两个属性，一个是底部导航栏，另一个就是主体内容
     */
    return new Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //底部导航栏的创建需要对应的功能标签作为子项，这里我就写了3个，每个子项包含一个图标和一个title。
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: new Text(
                '首页',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.event_note,
                //Icons.home,
                color: Colors.grey,
              ),
              title: new Text(
                '记录',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.visibility,
                //Icons.home,
                color: Colors.grey,
              ),
              title: new Text(
                '可视化',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.mood,
                color: Colors.grey,
              ),
              title: new Text(
                '我的',
              )),
        ],
        //这是底部导航栏自带的位标属性，表示底部导航栏当前处于哪个导航标签。给他一个初始值0，也就是默认第一个标签页面。
        currentIndex: _currentIndex,
        //这是点击属性，会执行带有一个int值的回调函数，这个int值是系统自动返回的你点击的那个标签的位标
        onTap: (int i) {
          //进行状态更新，将系统返回的你点击的标签位标赋予当前位标属性，告诉系统当前要显示的导航标签被用户改变了。
          setState(() {
            _currentIndex = i;
          //print(_currentIndex);
          });
        },
      ),
    );
  }
}

