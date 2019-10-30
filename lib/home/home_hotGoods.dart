import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHotGoods extends StatefulWidget {
  final List<Map> hotGoodsList;
  HomeHotGoods({Key key, this.hotGoodsList}) : super(key: key);

  _HomeHotGoodsState createState() => _HomeHotGoodsState();
}

class _HomeHotGoodsState extends State<HomeHotGoods> {
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    color: Colors.black12,
    child: Text(
      '火爆专区',
    ),
  );

  List<Widget> _warpChildWidgets() {
    if (widget.hotGoodsList.length > 0) {
      List<Widget> hotGoodsWidgets = widget.hotGoodsList.map((hotGood) {
        return InkWell(
          onTap: () {
            print('点击了火爆商品');
          },
          child: Container(
            width: ScreenUtil().setWidth(372),
            child: Column(
              children: <Widget>[
                Image.network(
                  hotGood['image'],
                  width: ScreenUtil().setWidth(375),
                ),
                Text(
                  hotGood['name'],
                  style: TextStyle(color: Colors.pink),
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    children: <Widget>[
                      // SizedBox(width: 20,),
                      RichText(
                        text: TextSpan(
                          text: '¥',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: '${hotGood['mallPrice']}',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black))
                          ],
                        ),
                      ),
                      // SizedBox(width: 60,),
                      Text(
                        '${hotGood['price']}',
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                )
              ],
            ),
          ),
        );
      }).toList();
      return hotGoodsWidgets;
    }
    return [];
  }

  Widget _warpWidget() {
    return Wrap(
      spacing: 2,
      children: _warpChildWidgets(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[hotTitle, _warpWidget()],
      ),
    );
  }
}
