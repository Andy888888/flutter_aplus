import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

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
          options.headers = getHeaders('Ceshigzywq', 'android');
        },
        onResponse: (Response response) {},
        onError: (DioError error) {
          int statusCode = error.response.statusCode;
          // 500、400、404 ...
        }));

//    Future<dynamic> ss = request();
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

  Future<dynamic> request() async {
    Response response = await _dio.post(
      '/test',
      data: {"id": 12, "name": "xx"},
    );

    return response.data;
  }
}
