import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/taurus_footer.dart';
import 'package:flutter_easyrefresh/taurus_header.dart';
import 'package:flutter_shop/home/home_ad.dart';
import 'package:flutter_shop/home/home_banner.dart';
import 'package:flutter_shop/home/home_floor.dart';
import 'package:flutter_shop/home/home_hotGoods.dart';
import 'package:flutter_shop/home/home_leaderPhone.dart';
import 'package:flutter_shop/home/home_navgitor.dart';
import 'package:flutter_shop/home/home_operation.dart';
import 'package:flutter_shop/home/home_operation_row.dart';
import 'package:flutter_shop/home/home_recommend.dart';
import 'package:flutter_shop/loading/loading.dart';
import 'package:flutter_shop/service/data_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _page = 1;
  List<Map> _hotGoodsList = [];
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
                 String adImageStr = data['data']['advertesPicture']['PICTURE_ADDRESS'];
                 String leaderImageName = data['data']['shopInfo']['leaderImage'];
                 String leaderPhone = data['data']['shopInfo']['leaderPhone'];
                 List<Map> recommendList = (data['data']['recommend'] as List).cast();
                 List<String> operation1 = [data['data']['saoma']['PICTURE_ADDRESS'], data['data']['integralMallPic']['PICTURE_ADDRESS'], data['data']['newUser']['PICTURE_ADDRESS']];
                 String floor1HeaderImageName = data['data']['floor1Pic']['PICTURE_ADDRESS'];
                 List<Map> floor1ContentArr = (data['data']['floor1'] as List).cast();
                 return EasyRefresh(
                   header: TaurusHeader(),
                   footer: TaurusFooter(),
                   child: ListView(
                     children: <Widget>[
                      Container(
                        child: HomeBanner(bannerData),
                        width: double.infinity,
                        height: ScreenUtil().setHeight(250),
                      ),
                      HomeNavigator(navigatorData),
                      Container(height: 5, color: Colors.grey[200],),
                      HomeAd(adImageStr),
                      HomeLeaderPhone(leaderPhone, leaderImageName),
                      Container(height: 5, color: Colors.grey[200],),
                      HomeOpreationRow(rowData: operation1),
                      HomeRecommend(recommendList: recommendList),
                      // HomeOperation(operationInfo: data['data']['floor1Pic']),
                      HomeFloor(headerImageName: floor1HeaderImageName, floorContent: floor1ContentArr),
                      HomeHotGoods(hotGoodsList: _hotGoodsList),
                    ],
                   ),
                   onRefresh: () async {
                     print('refresh');
                   },
                   onLoad: () async {
                     print('onload');
                     _hotGoods();
                   },
                 );
               } else {
                 return Center(
                   child: Loading(),
                 );
               }
             },
         ),
       ),
    );
  }

  void _hotGoods() {
    DataUtil.requestHomeBelowConten({'page': _page}).then((value){
      var data = json.decode(value.toString());
      List<Map> newGoodsList = (data['data'] as List).cast();
      setState(() {
        _page++;
        _hotGoodsList.addAll(newGoodsList);
      });
    });
  }
}