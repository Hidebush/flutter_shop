import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeOpreationRow extends StatelessWidget {
  final List<String> rowData;
  const HomeOpreationRow({Key key, this.rowData}) : super(key: key);

  List<Widget> _subWidgetList() {
    List<Widget> list = [];
    var imageW = ScreenUtil.screenWidthDp / rowData.length;
    for (var str in rowData) {
      list.add(Image.network(str, width: imageW, fit: BoxFit.cover,));
    }
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      height: ScreenUtil().setHeight(250),
      child: Row(
        children: _subWidgetList(),
      ),
    );
  }
}