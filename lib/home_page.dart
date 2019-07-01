import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key key}) : super(key: key);

//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        child: child,
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  _HomePageState  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _edittingController = TextEditingController();
  String _showText = '这儿展示结果哦';
  Future requestHttp(String inputText) async {
    Map<String, dynamic> params = {
      'name': inputText
    };
    try {
      Response response = await Dio().get('https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian', queryParameters: params);
      return response.data;
    } catch (e) {
      return e;
    }
  }

  void _choiceAction() {
    if (_edittingController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          
          return CupertinoAlertDialog(
            title: Text('类型不能为空'),
          );
          // return AlertDialog(
          //   title: Text('请选择小姐姐类型'),
          // );
        }
      );
    } else {
      requestHttp(_edittingController.text).then((value) {
        setState(() {
          _showText = value['data']['name'].toString();
        });
      });
    }
  }

  @override
  void dispose() {
    _edittingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _edittingController,
            decoration: InputDecoration(
              labelText: '输入类型',
              helperText: '请输入小类型',
              contentPadding: EdgeInsets.all(16.0),
            ),
            autofocus: false,
          ),
          RaisedButton(
            onPressed: _choiceAction,
            child: Text('选择完毕'),
          ),
          Text(
            _showText,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}