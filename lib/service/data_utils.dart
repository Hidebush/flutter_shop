import 'package:dio/dio.dart';
import 'package:flutter_shop/service/net_utils.dart';
import '../service/api.dart';
class DataUtil {
  static Future requestHomeContent(Map<String, dynamic> params) async {
    var response = await NetUtils.post(API.HomePageContentPath, params);
    print(response.toString());
    return response;
  }
}