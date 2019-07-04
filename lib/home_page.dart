import 'package:flutter/material.dart';
import 'package:flutter_shop/service/data_utils.dart';
import 'package:flutter_shop/service/net_utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    var params = {'lon':'115.02932','lat':'35.76189'};
    DataUtil.requestHomeContent(params).then((data) {
      // if (data['code'] == 0) {
      //   print(data['data']);
      // }
      
      print(data['code']);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text('百姓生活+'),
         ),
         body: SingleChildScrollView(
           child: Text('首页'),
         ),
       ),
    );
  }
}