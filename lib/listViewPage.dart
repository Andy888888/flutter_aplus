import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('ListView界面'),
        ),
        body: Center(
          child: MyListView(
            dataSource: new List<String>.generate(100, (i) => "Lina $i"),
          ),
        ),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  final List<String> dataSource;

  const MyListView({Key key, this.dataSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(dataSource[index]),
          );
        });
  }
}

