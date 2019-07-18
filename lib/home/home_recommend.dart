import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeRecommend extends StatelessWidget {
  final List<Map> recommendList;
  const HomeRecommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(305),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          RecTitlePart(title: '商品推荐'),
          Container(
            height: ScreenUtil().setHeight(255),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recommendList.length,
              itemBuilder: (context, index){
                return RecItem(model: recommendList[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class RecItem extends StatelessWidget {
  final Map model;
  const RecItem({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('点击了推荐商品');
      },
      child: Container(
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.black12, width: 0.5)),
        ),
        child: Column(
          children: <Widget>[
            Image.network(model['image']),
            SizedBox(height: 10,),
            Text(
              '¥ ${model['mallPrice']}',
              style: TextStyle(
                fontSize: 14
              ),
            ),
            Text(
              '¥ ${model['price']}',
              style: TextStyle(
                fontSize: 10, 
                color: Colors.grey,
                decoration: TextDecoration.lineThrough
              ),
            ),
          ],
        ),
      )
    );
  }
}

/// 推荐标题
class RecTitlePart extends StatelessWidget {
  final String title;
  const RecTitlePart({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 5.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5
          ),
        )
      ),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.pink),
      ),
    );
  }
}