import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/data_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zefyr/zefyr.dart';
import 'package:notus/convert.dart';
class FeedBackPage extends StatefulWidget{
  @override
  State<FeedBackPage> createState(){
    return FeedBackPageState();
  }
}
class FeedBackPageState extends State<FeedBackPage>{
  final TextEditingController _controller = new TextEditingController();
  final ZefyrController _zefyrController = new ZefyrController(NotusDocument());
  
  String _title = "";
  var _delta;
  final FocusNode _focusNode = new FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    _controller.addListener((){
      setState(() {
        _title = _controller.text;
      });
    });
    _zefyrController.document.changes.listen((change){
      setState(() {
        _delta = _zefyrController.document.toDelta();
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    _zefyrController.dispose();
    super.dispose();
  }
  _submit() {
    if (_title.trim().isEmpty) {
      _show('标题不能为空');
    } else {
      String mk = (_delta == null)
          ? 'No description provided.'
          : notusMarkdown.encode(_delta);
      DataUtils.postFeedBack({'title': _title, "body": mk}).then((result) {
        _show('提交成功');
        Navigator.maybePop(context);
      });
    }
  }

  _show(String msgs) {
    Fluttertoast.showToast(
        msg: msgs,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Theme.of(context).primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        child:Scaffold(
      appBar: AppBar(
        title: Text('用户反馈'),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){ _submit();}, icon: Icon(
            Icons.near_me,color: Colors.white,size: 12,
          ), label: Text('send',style: TextStyle(color: Colors.grey),)),
        ],
        elevation: 1.0,
      ),
          body: ZefyrScaffold(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListView(
                children: <Widget>[
                  Text('title'),
                  new TextFormField(
                    maxLength: 50,
                    controller: _controller,
                    decoration: new InputDecoration(
                      hintText: 'Title'
                    ),
                  ),
                  Text('content'),
                  _descriptionEditor()
                ],
              ),
            ),
          ),
    ),
      onWillPop: () {
        print('点击了返回键');
        Navigator.pop(context, null);
      }
    );
  }
  Widget _descriptionEditor(){
    final theme = new ZefyrThemeData(
      toolbarTheme: ZefyrToolbarTheme.fallback(context).copyWith(
        color: Colors.grey.shade800,
        toggleColor: Colors.grey.shade900,
        iconColor: Colors.white,
        disabledIconColor: Colors.grey.shade500,
      )
    );
    return ZefyrTheme(
      data: theme,
      child: ZefyrField(
        height: 400.0,
        decoration: InputDecoration(labelText: 'Description'),
        controller: _zefyrController,
        focusNode: _focusNode,
        autofocus: true,
        physics: ClampingScrollPhysics(),
      ),
    );
  }
}