import 'package:flutter/material.dart';
import 'package:flutter_shop/Category/Model/categoryGoodsList.dart';

class CategoryGoodsListProvider with ChangeNotifier {
  List<CategoryGoods> goodsList = List();
  getGoodsList(List<CategoryGoods> list) {
    goodsList = list;
    notifyListeners();
  }
}