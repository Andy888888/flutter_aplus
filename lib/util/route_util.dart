import 'dart:convert';

class RouteUtil {
  static String getPageName(String s) {
    if (s.indexOf("?") == -1) {
      return s;
    } else {
      return s.substring(0, s.indexOf("?"));
    }
  }

  static String getPageParamJson(String json) {
    if (json.indexOf("?") == -1) {
      return "{}";
    } else {
      return json.substring(json.indexOf("?") + 1);
    }
  }

}
