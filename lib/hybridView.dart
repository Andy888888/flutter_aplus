import 'package:flutter/material.dart';
import 'dart:ui';
import 'gridViewPage.dart';
import 'cardPage.dart';
import 'listViewPage.dart';
import 'project/edit_property.dart';

class HybridView{
  Widget widgetForRoute(String route){
    switch(route){
      case "route1":
        return Center(
          child: new ListViewPage(),
        );
      case "route2":
        return Center(
          child: new GridViewPage(),
        );
      case "route3":
        return Center(
          child: new CardPage(),
        );
      case "editProperty":
        return Center(
          child: new EditPropertyPage(),
        );
      default:
        return Center(
          child: new EditPropertyPage(),
        );
    }
  }
}
