import 'package:dio/dio.dart';
import 'package:flutter_shop/service/net_utils.dart';
import '../service/api.dart';
class DataUtil {
  static Future requestHomeContent(Map<String, dynamic> params) async {
    var response = await NetUtils.post(API.HomePageContentPath, params);
    print(response.toString());
    return response;
  }

  static Future requestHomeBelowConten(Map<String, dynamic> params) async {
    var response = await NetUtils.post(API.HomePageBelowContenPath, params);
    print('----------------hot good ---------');
    print(response.toString());
    return response;
  }

  static Future requestCategoryContent() async {
    var response = await NetUtils.post(API.CategoryGetCategoryPath, null);
    // print(response.toString());
    return response;
  }

  static Future requestCategoryMallGoods(Map<String, dynamic> params) async {
    var response = await NetUtils.post(API.CategoryGetMallGoodsPath, params);
    // print('----------------mall goods ---------');
    // print(response.toString());
    return response;
  }

}