import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/Category/Model/Category.dart';
import 'package:flutter_shop/Category/leftCategoryNav.dart';
import 'package:flutter_shop/Category/rightCategoryNav.dart';
import 'package:flutter_shop/Provider/child_category.dart';
import 'package:flutter_shop/service/data_utils.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
      ),
      body: MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => ChildCategory(),)
      ], child: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),
            Column(
              children: <Widget>[
                RightCategoryNav()
              ],
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Text('点击了'),
      ),
    );
  }
}