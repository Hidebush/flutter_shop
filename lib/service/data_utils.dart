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
}