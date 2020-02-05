import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/service/data_utils.dart';
import 'package:flutter_shop/Category/Model/Category.dart';
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:flutter_shop/Provider/child_category.dart';

class LeftCategoryNav extends StatefulWidget {
  LeftCategoryNav({Key key}) : super(key: key);

  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List<CategoryBigModel> list = [];
  int _clickIndex = 0;

  @override
  void initState() {
    _requestCategoryData();
    super.initState();
  }

  void _requestCategoryData() async {
    await DataUtil.requestCategoryContent().then((value) {
      var data = json.decode(value.toString());
      CategoryBigListModel listModel =
          CategoryBigListModel.formJson(data['data']);
      setState(() {
        list = listModel.data;
      });
      Provider.of<ChildCategory>(context, listen: false).getChildCategory(list.first.bxMallSubDto);
    });
  }

  Widget _leftInkwell(int index) {
    bool _isClick = false;
    _isClick = (_clickIndex == index);

    return InkWell(
      onTap: () {
        setState(() {
          _clickIndex = index;
        });
        List dataList = list[index].bxMallSubDto;
        Provider.of<ChildCategory>(context, listen: false).getChildCategory(dataList);
      },
      child: Container(
        height: ScreenUtil().setWidth(100),
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: _isClick ? Color.fromRGBO(236, 238, 239, 1.0) : Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12)),
        ),
        child: Text(list[index].mallCategoryName,
            style: TextStyle(fontSize: ScreenUtil().setSp(28))),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _leftInkwell(index);
        },
      ),
    );
  }
}
