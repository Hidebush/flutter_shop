import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/Category/Model/Category.dart';
import 'package:flutter_shop/Category/leftCategoryNav.dart';
import 'package:flutter_shop/service/data_utils.dart';

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
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Text('点击了'),
      ),
    );
  }
}