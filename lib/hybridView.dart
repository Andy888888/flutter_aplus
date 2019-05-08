import 'package:flutter/material.dart';
import 'dart:ui';
import 'gridViewPage.dart';
import 'cardPage.dart';
import 'listViewPage.dart';
import 'project/edit_property.dart';
import 'package:flutter_aplus/util/json_util.dart';
import 'package:flutter_aplus/util/route_util.dart';
import 'image_test.dart';

class HybridView {
  Widget widgetForRoute(String route) {
    String page = RouteUtil.getPageName(route);
    String json = RouteUtil.getPageParamJson(route);
    print("-------------------------:" + page);
    print("-------------------------:" + json);
    Map<String, dynamic> map = JsonUtil.json2Map(json);

    switch (page) {
      case "list":
        return Center(
          child: new ListViewPage(),
        );
      case "grid":
        return Center(
          child: new GridViewPage(),
        );
      case "card":
        return Center(
          child: new CardPage(),
        );
      case "edit-property":
        return Center(
          child: new EditPropertyPage().setParam(map['keyId'].toString(),
              int.tryParse(map['trustType'].toString())),
        );
      case "image_test":
        return Center(
          child: new StackImages(),
        );
      default:
        return Center(
          child: new StackImages(),
        );
//        return Center(
//          child: new EditPropertyPage().setParam(map['keyId'].toString(),
//              int.tryParse(map['trustType'].toString())),
//        );
    }
  }
}
