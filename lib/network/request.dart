import 'package:dio/dio.dart';

class RequestManager {
  Dio _dio;

  RequestManager() {
    BaseOptions _options = new BaseOptions(
        baseUrl: "https://www.xx.com/api",
        connectTimeout: 5000,
        receiveTimeout: 3000);
    _dio = new Dio(_options);

    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          int check = DateTime.now().millisecondsSinceEpoch;
          options.headers['version'] = '1.0.0';
          options.headers['check'] = check;
        },
        onResponse: (Response response) {},
        onError: (DioError error) {
          int statusCode = error.response.statusCode;
          // 500、400、404 ...
        }));

//    Future<dynamic> ss = request();
  }

  Future<dynamic> request() async {
    Response response = await _dio.post(
      '/test',
      data: {"id": 12, "name": "xx"},
    );

    return response.data;
  }
}
