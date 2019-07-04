import 'dart:async';
import 'dart:io';  
import 'package:dio/dio.dart';

Map<String, dynamic> optHeader = {
  // 'POST': '/baixing/wxmini/homePageContent HTTP/1.1',
  // 'Host':	'wxmini.baixingliangfan.cn',
  'Content-Type':	'application/x-www-form-urlencoded',
  'Accept-Encoding':	'br, gzip, deflate',
  'Connection':	'keep-alive',
  'Accept':	'*/*',
  'User-Agent':	'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16C101 MicroMessenger/7.0.4(0x17000428) NetType/WIFI Language/zh_CN',
  'Referer':	'https://servicewechat.com/wxb6ec0fa3b296a9f3/43/page-frame.html',
  'Accept-Language':	'zh-cn',
};

var dio = Dio(
  BaseOptions(
    // connectTimeout: 30000,
    headers: optHeader
  )
);

class NetUtils {
  static Future get(String url, Map<String, dynamic> params) async {
    Response response;
    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    return response.data;
  }

  static Future post(String url, Map<String, dynamic> params) async {
    try {
      Response response = await dio.post(url, queryParameters: params);
     print(response.toString());
     if (response.statusCode == 200) {
       return response.data;
     } else {
       throw Exception('后端接口出现异常..');
     }
    } catch (e) {
      return print('ERROR:======>$e');
    }
  }
}