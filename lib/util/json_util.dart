import 'dart:convert';

class JsonUtil{
  static Map<String, dynamic> json2Map(String jsonString) {
    return json.decode(jsonString);
  }

  static String getJsonValueForKey(String jsonString, String key) {
    return json2Map(jsonString)[key];
  }
}