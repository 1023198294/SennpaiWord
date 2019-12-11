import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomePageWidgetState();
  }
}

class HomePageWidgetState extends State<HomePageWidget>{

  var title = 'unknown';
  @override

  Widget build(BuildContext context) {
    _get() async{
      var url = 'http://10.0.2.2:5000';
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      //print(responseBody);
      return responseBody;
    }
    _get().then((result) {
        title = result;
        print('结果就是$title');
      }
    );
    print(title);
    return new Scaffold(
      appBar: AppBar(
        title: new Text('title:$title'),
      ),
      body: new Center(
        child: Icon(Icons.home,size: 130.0,color: Colors.blue,),
      ),
    );
  }
}

