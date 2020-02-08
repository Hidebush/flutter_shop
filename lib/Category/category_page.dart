import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/Category/Model/Category.dart';
import 'package:flutter_shop/Category/Model/categoryGoodsList.dart';
import 'package:flutter_shop/Category/leftCategoryNav.dart';
import 'package:flutter_shop/Category/rightCategoryNav.dart';
import 'package:flutter_shop/Provider/category_goods_list_provider.dart';
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
      body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ChildCategory(),
            ),
            ChangeNotifierProvider(
              create: (context) => CategoryGoodsListProvider(),
            )
          ],
          child: Container(
            child: Row(
              children: <Widget>[
                LeftCategoryNav(),
                Column(
                  children: <Widget>[RightCategoryNav(), CategoryGoodsList()],
                )
              ],
            ),
          )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Text('点击了'),
      // ),
    );
  }
}

class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  Widget _goodsImage(goods) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(goods.image),
    );
  }

  Widget _goodsName(goods) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        goods.goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(goods) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
            '价格:￥${goods.presentPrice}',
            style:
                TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
          ),
          Text(
            '￥${goods.oriPrice}',
            style: TextStyle(
                color: Colors.black26, decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }

  Widget _ListWidget(CategoryGoods goods) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.black12))),
          child: Row(
            children: <Widget>[
              _goodsImage(goods),
              Column(
                children: <Widget>[_goodsName(goods), _goodsPrice(goods)],
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryGoods> goodsList =
        Provider.of<CategoryGoodsListProvider>(context).goodsList;
    return Expanded(
        child: Container(
          width: ScreenUtil().setWidth(570),
          child: ListView.builder(
            itemCount: goodsList == null ? 0 : goodsList.length,
            itemBuilder: (context, index) {
            return _ListWidget(goodsList[index]);
          },
        ),
      )
    );
  }
}
