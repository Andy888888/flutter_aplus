import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';
import 'package:flutter_aplus/network/property.dart';

class RequestManager {
  Dio _dio;

  RequestManager() {
    BaseOptions _options =
        new BaseOptions(connectTimeout: 5000, receiveTimeout: 3000);
    _dio = new Dio(_options);
//    Future<dynamic> ss = request();
  }

  void aplusProtocol() {
    _dio.interceptors.clear();
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          options.baseUrl = 'http://10.7.11.39:11061/api';
          options.headers = getHeaders('Ceshigzywq', 'android');
        },
        onResponse: (Response response) {},
        onError: (DioError error) {
          int statusCode = error.response.statusCode;
          // 500、400、404 ...
        }));
  }

  void newsProtocol() {
    _dio.interceptors.clear();
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          options.baseUrl = 'http://toutiao-ali.juheapi.com';
          options.headers['Authorization'] =
              'APPCODE 1b56403f51d84d66812ac7aa274fefe6';
        },
        onResponse: (Response response) {},
        onError: (DioError error) {
          int statusCode = error.response.statusCode;
          // 500、400、404 ...
        }));
  }

  static Map<String, String> getHeaders(String userNo, String platform) {
    Map<String, String> header = Map<String, String>();

    String key = "CYDAP_com-group";
    String company = "~Centa@";
    String unixTime = DateTime.now().millisecondsSinceEpoch.toString();
    String sign = generateMd5(key + company + unixTime + userNo);

    header['platform'] = platform;
    header['staffno'] = userNo;
    header['number'] = unixTime;
    header['sign'] = sign;

    return header;
  }

  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  Future<Response<String>> commitProperty(Property property) async {
    // todo: 这里应该换成其他方式json转换
    String jsonString = json.encode(property);
    print('=============');
    print(jsonString);
    print('=============');

    return await _dio.post<String>(
      '/property/property-edit',
      data: property,
    );
  }

  Future<Response<String>> getNews(String type) async {
    return await _dio.get<String>('/toutiao/index?type=$type');
  }
}
