import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/Provider/child_category.dart';
import 'package:provider/provider.dart';

class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {

  Widget _rightInkWell(String str) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          str,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var list = Provider.of<ChildCategory>(context).childCategoryList;
    return Container(
      child: Container(
        height: ScreenUtil().setHeight(80),
        width: ScreenUtil().setWidth(570),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list == null ? 0 : list.length,
          itemBuilder: (context, index) {
            return _rightInkWell(list[index]["mallSubName"]);
          },
        ),
      ),
    );
  }
}
