import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RowPage',
      home: Scaffold(
          appBar: AppBar(
            title: new Text('RowPage'),
          ),
          body: new Row(
            children: <Widget>[
              // ignore: invocation_of_non_function
              new Expanded(
                  child: new RaisedButton(
                onPressed: () {},
                color: Colors.blue,
                child: new Text('测试'),
              )),
              new Expanded(
                  child: new RaisedButton(
                    onPressed: () {},
                    color: Colors.blue,
                    child: new Text('测试'),
                  )),
              new Expanded(
                  child: new RaisedButton(
                    onPressed: () {},
                    color: Colors.blue,
                    child: new Text('测试'),
                  ))
            ],
          )),
    );
  }
}
