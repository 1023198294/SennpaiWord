import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zefyr/zefyr.dart';
import 'package:notus/convert.dart';
class ChangeInfoPage extends StatefulWidget{
  @override
  State<ChangeInfoPage> createState(){
    return ChangeInfoPageState();
  }
}
class ChangeInfoPageState extends State<ChangeInfoPage>{
  var _imgPath;
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
    @override
  Widget build(BuildContext context) {

    return WillPopScope(
        child:Scaffold(
          appBar: AppBar(
            title: Text('修改信息'),
          ),
          body: Column(
            children:[
              _imageView(_imgPath),
              RaisedButton(
            onPressed: _openGallery,
            child: Text('选择图片'),
            ),
        ],
          )
        ),

        onWillPop: () {
          print('点击了返回键');
          Navigator.pop(context, null);
        }
    );
  }
  _openGallery() async{
    var image = await ImagePicker.pickImage(source:ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }
  Widget _imageView(imgPath){
    if (imgPath == null) {
      return Center(
        child: Text('请选择图片'),
      );
    }else{
      return Image.file(imgPath);
    }
  }
}