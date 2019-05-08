import 'package:flutter/material.dart';

class StackImages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StackImageState();
  }
}

class StackImageState extends State<StackImages> {
  var images = <String>[];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];

    for (int i = 0; i <= index; i++) {
      var pos = i - (i ~/ 103) * 103;
      widgets.add(new Container(
          child: new Image.asset("images/${pos}.jpg", fit: BoxFit.cover),
          padding: new EdgeInsets.only(top: i * 2.0)));
    }

    widgets.add(new Center(
        child: new GestureDetector(
            child: new Container(
                child: new Text("添加图片(${index})",
                    style: new TextStyle(color: Colors.red)),
                color: Colors.green,
                padding: const EdgeInsets.all(8.0)),
            onTap: () {
              setState(() {
                index++;
              });
            })));

    return MaterialApp(
      title: 'ListView',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('ListView界面'),
        ),
        body:
            Stack(children: widgets, alignment: AlignmentDirectional.topCenter),
      ),
    );
  }
}
