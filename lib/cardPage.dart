import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '卡片',
      home: Scaffold(
        appBar: AppBar(
          title: Text('卡片'),
        ),
        body: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                  leading: new Icon(Icons.account_box, color: Colors.lightBlue),
                  title: Text('钢铁侠', style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text('山洞里出来的技术控')
              ),
              new Divider(),
              ListTile(
                  leading: new Icon(Icons.account_box, color: Colors.lightBlue),
                  title: Text('雷神', style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text('对锤子有特殊情感')
              ),
              new Divider(),
              ListTile(
                  leading: new Icon(Icons.account_box, color: Colors.lightBlue),
                  title: Text('惊奇队长', style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text('倔强到原地起飞的姑娘')
              )
            ],
          ),
        )
      )
    );
  }
}
