import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeNavigator extends StatelessWidget {
  final List<Map> dataList;
  const HomeNavigator(this.dataList, {Key key}) : super(key: key);

  Widget _subItemView(BuildContext context, Map item) {
    return InkWell(
      onTap: (){
        print('点击了inkwell');
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (dataList.length > 10) {
      dataList.removeRange(10, dataList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(310),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        physics: NeverScrollableScrollPhysics(), /// 禁止滚动
        padding: EdgeInsets.all(4.0),
        children:dataList.map((item){
          return _subItemView(context, item);
        }).toList(),
      ),
    );
  }
}