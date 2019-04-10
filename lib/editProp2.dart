import 'package:flutter/material.dart';

var title = '编辑房源';
String orientation = '南';

FocusNode _buildFocusNode = FocusNode();
FocusNode _pragmaticFocusNode = FocusNode();
FocusNode _rentFocusNode = FocusNode();
FocusNode _commentFocusNode = FocusNode();

TextEditingController _buildController = TextEditingController(
  text: '150.00',
);
TextEditingController _pragmaticController = TextEditingController(text: '');
TextEditingController _rentController = TextEditingController(text: '2222');
TextEditingController _commentController = TextEditingController(text: '');

/// 应用程序Application
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: EditProperty(),
    );
  }
}

class EditProperty extends StatefulWidget {
  @override
  PropertyState createState() => PropertyState();
}

class PropertyState extends State<EditProperty>
    implements OrientationSelectCallback {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context, title),
      body: EditPropertyBody(this),
    );
  }

  Widget _appBar(BuildContext context, String title) {
    return AppBar(
      title: new Text(title),
      actions: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 60,
              child: FlatButton(
                child: Text(
                  '重置',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _reset();
                },
              ),
            ),
            Container(
              width: 60,
              child: FlatButton(
                child: Text(
                  '提交',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _showMsg(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _reset() {
    _buildController.text = '';
    _pragmaticController.text = '';
    _rentController.text = '';
    _commentController.text = '';
  }

  void _showMsg(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('标题'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                new Text('建筑面积：' + _buildController.text),
                new Text('实用面积：' + _pragmaticController.text),
                new Text('租价：' + _rentController.text),
                new Text('点评内容：' + _commentController.text),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void select(String newSelect) {
    setState(() {
      orientation = newSelect;
    });
  }
}

abstract class OrientationSelectCallback {
  void select(String newSelect);
}

class EditPropertyBody extends StatelessWidget {
  final OrientationSelectCallback callback;

  EditPropertyBody(this.callback);

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        _buildFocusNode.unfocus();
        _pragmaticFocusNode.unfocus();
        _rentFocusNode.unfocus();
        _commentFocusNode.unfocus();
      },
      child: Container(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.all(0.0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                  <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Text(
                        '基本信息',
                        style: TextStyle(
                          fontSize: 22.0,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text('建筑面积')),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              focusNode: _buildFocusNode,
                              controller: _buildController,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(7.0),
                                hintText: '请输入建筑面积',
//                                icon: Icon(Icons.attach_money),
//                                labelText: '建筑面积',
                              ),
                              autofocus: false,
                            ),
                          ),
                          Text(
                            '㎡',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Divider(),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text('实用面积')),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.right,
                              focusNode: _pragmaticFocusNode,
                              controller: _pragmaticController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(7.0),
                                hintText: '请输入实用面积',
//                                icon: Icon(Icons.attach_money),
//                                labelText: '实用面积',
                              ),
                              autofocus: false,
                            ),
                          ),
                          Text(
                            '㎡',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    FragmentDivider(),
                  ],
                ),
              ),
            ),
            new SliverPadding(
              padding: const EdgeInsets.all(0.0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                  <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: GestureDetector(
                        onTapUp: (tapUpDetails) {
                          _showOrientation(context);
                        },
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Text('朝向')),
                            Text(orientation),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Divider(),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(child: Text('房型')),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              SquareLabel(Colors.grey, '3')
                                  .setWidth(50)
                                  .setLeftPadding(20),
                              Text('室'),
                              SquareLabel(Colors.grey, '1')
                                  .setWidth(50)
                                  .setLeftPadding(20)
                                  .setLeftMargin(10),
                              Text('厅'),
                              SquareLabel(Colors.grey, '1')
                                  .setWidth(50)
                                  .setLeftPadding(20)
                                  .setLeftMargin(10),
                              Text('厨'),
                              SquareLabel(Colors.grey, '2')
                                  .setWidth(50)
                                  .setLeftPadding(20)
                                  .setLeftMargin(10),
                              Text('卫'),
                            ],
                          )
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Divider(),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text('租价')),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 13),
                              focusNode: _rentFocusNode,
                              keyboardType: TextInputType.number,
                              controller: _rentController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(7.0),
                                hintText: '请输入租价',
//                                labelText: '请输入租价',
                              ),
                              autofocus: false,
                            ),
                          ),
                          Text(
                            '元',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Divider(),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(child: Text('房源属性')),
                              Text('请选择'),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              SquareLabel(Colors.red, '南北通透'),
                              SquareLabel(Colors.red, '主卧朝南'),
                              SquareLabel(Colors.red, '双卫生间'),
                            ],
                          ),
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    FragmentDivider(),
                  ],
                ),
              ),
            ),
            new SliverPadding(
              padding: const EdgeInsets.all(0.0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                  <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '出租点评',
                        style: TextStyle(
                          fontSize: 22.0,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    MultiInput(_commentFocusNode),
                    BottomLine(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showOrientation(BuildContext context) {
    List<String> dataSource = new List<String>();
    dataSource.add('东');
    dataSource.add('西');
    dataSource.add('南');
    dataSource.add('北');

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return OrientationListView(
          dataSource: dataSource,
          callback: callback,
        );
      },
    ).then((val) {
      print(val);
    });
  }
}

class OrientationListView extends StatelessWidget {
  final List<String> dataSource;
  final OrientationSelectCallback callback;

  const OrientationListView({Key key, this.dataSource, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataSource.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(dataSource[index]),
            onTap: () {
              callback.select(dataSource[index]);
              Navigator.pop(context);
            },
          );
        });
  }
}

// 控件

class FragmentDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color.fromARGB(255, 245, 245, 240),
      height: 10.0,
    );
  }
}

class MultiInput extends StatelessWidget {
  FocusNode commentFocusNode;

  MultiInput(this.commentFocusNode);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.all(10),
        color: Color.fromARGB(222, 240, 240, 240),
        child: Theme(
          data: new ThemeData(
            primaryColor: Color.fromARGB(255, 222, 222, 222),
            hintColor: Color.fromARGB(255, 222, 222, 222),
          ),
          child: TextField(
            focusNode: commentFocusNode,
            controller: _commentController,
            maxLines: 10,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ));
  }
}

class BottomLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 30),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(),
          ),
          Text(
            '我是有底线的',
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
          Expanded(
            child: Divider(),
          )
        ],
      ),
    );
  }
}

class SquareLabel extends StatelessWidget {
  Color borderColor;
  String text;
  double width = 84;
  double leftPadding = 10;
  double leftMargin = 0;

  SquareLabel(this.borderColor, this.text);

  SquareLabel setWidth(double width) {
    this.width = width;
    return this;
  }

  SquareLabel setLeftPadding(double leftPadding) {
    this.leftPadding = leftPadding;
    return this;
  }

  SquareLabel setLeftMargin(double leftMargin) {
    this.leftMargin = leftMargin;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
//        margin: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(leftMargin, 15, 10, 10),
        color: Color.fromARGB(222, 240, 240, 240),
        child: Theme(
          data: new ThemeData(
            primaryColor: borderColor,
            hintColor: borderColor,
          ),
          child: TextField(
//            textAlign: TextAlign.center,
            controller: TextEditingController(
              text: text,
            ),
            enabled: false,
            decoration: InputDecoration(
//              contentPadding: EdgeInsets.all(10.0),
              contentPadding: EdgeInsets.fromLTRB(leftPadding, 5, 10, 5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.0),
              ),
            ),
          ),
        ));
  }
}
