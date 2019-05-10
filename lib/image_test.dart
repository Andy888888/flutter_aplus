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
    images.add('http://b.hiphotos.baidu.com/image/pic/item/32fa828ba61ea8d3fcd2e9ce9e0a304e241f5803.jpg');
    images.add('http://e.hiphotos.baidu.com/image/pic/item/b8014a90f603738d6d8d0d65bd1bb051f919ecb6.jpg');
    images.add('http://a.hiphotos.baidu.com/image/pic/item/38dbb6fd5266d01681fbe0859d2bd40734fa35b8.jpg');
    images.add('http://e.hiphotos.baidu.com/image/pic/item/b03533fa828ba61ef47bb6824b34970a314e5981.jpg');
    images.add('http://d.hiphotos.baidu.com/image/pic/item/a8014c086e061d95c1df499571f40ad163d9ca86.jpg');
    images.add('http://d.hiphotos.baidu.com/image/pic/item/f703738da977391200fafbccf2198618377ae2bb.jpg');
    images.add('http://e.hiphotos.baidu.com/image/pic/item/9f2f070828381f302d7ff404a3014c086e06f03d.jpg');

    for (int i = 0; i <= index; i++) {
      var pos = i % images.length;
      widgets.add(new Container(
//          child: new Image.asset("images/${pos}.jpg", fit: BoxFit.cover),
          child: new Image.network(
              images[pos],
              fit: BoxFit.cover),
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
