import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/service/data_utils.dart';
import 'package:flutter_shop/Category/Model/Category.dart';
import 'dart:convert';

class LeftCategoryNav extends StatefulWidget {
  LeftCategoryNav({Key key}) : super(key: key);

  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List<CategoryBigModel> list = [];

  @override
  void initState() {
    _requestCategoryData();
    super.initState();
  }

  void _requestCategoryData() async {
    await DataUtil.requestCategoryContent().then((value){
      var data = json.decode(value.toString());
      CategoryBigListModel listModel = CategoryBigListModel.formJson(data['data']);
      setState(() {
        list = listModel.data;
      });
    });
    
  }

  Widget _leftInkwell(int index) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        height: ScreenUtil().setWidth(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12)
          )
        ),
        child: Text(list[index].mallCategoryName, style: TextStyle(fontSize: ScreenUtil().setSp(28))),
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