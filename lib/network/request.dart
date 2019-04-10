import 'package:dio/dio.dart';

class RequestManager {
  Dio _dio;

  RequestManager() {
    // 或者通过传递一个 `options`来创建dio实例
    BaseOptions _options = new BaseOptions(
        baseUrl: "https://www.xx.com/api",
        connectTimeout: 5000,
        receiveTimeout: 3000);
    _dio = new Dio( _options);
  }
}
