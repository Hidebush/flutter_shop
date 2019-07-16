import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/home/home_banner.dart';
import 'package:flutter_shop/home/home_navgitor.dart';
import 'package:flutter_shop/service/data_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    // var params = {'lon':'115.02932','lat':'35.76189'};
    // DataUtil.requestHomeContent(params).then((data) {
    //   // if (data['code'] == 0) {
    //   //   print(data['data']);
    //   // }
      
    //   print(data['code']);
    // });
  }
  @override
  Widget build(BuildContext context) {
    var params = {'lon':'115.02932','lat':'35.76189'};
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text('百姓生活+'),
         ),
         body: FutureBuilder(
             future: DataUtil.requestHomeContent(params), 
             builder: (BuildContext context, AsyncSnapshot snapshot) {
               if (snapshot.hasData) {
                 var data = json.decode(snapshot.data.toString());
                 List<Map> bannerData = (data['data']['slides'] as List).cast();
                 List<Map> navigatorData = (data['data']['category'] as List).cast();
                 return Column(
                   children: <Widget>[
                     Container(
                      child: HomeBanner(bannerData),
                      width: double.infinity,
                      height: ScreenUtil().setHeight(333),
                     ),
                     HomeNavigator(navigatorData),
                   ],
                 );
               } else {
                 return Center(
                   child: Text('loading...'),
                 );
               }
             },
         ),
       ),
    );
  }
}