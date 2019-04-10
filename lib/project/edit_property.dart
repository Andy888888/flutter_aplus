import 'package:flutter/material.dart';
import 'house_type.dart';
import 'bottom_selection.dart';
import 'event_callback.dart';
import 'widgets.dart';
import 'square_label.dart';
import 'package:flutter_aplus/network/request.dart';

/// resource
var _title = '编辑房源';
List<String> _orientation = <String>[
  '东',
  '西',
  '南',
  '北',
];
List<String> _properties = <String>[
  '南北通透',
  '双卫生间',
  '主卧朝南',
  '满五唯一',
  '学区房',
  '低楼层',
];
List<String> _houseCount = <String>[
  '1','2','3','4','5'
];

FocusNode _buildFocusNode = FocusNode();
FocusNode _pragmaticFocusNode = FocusNode();
FocusNode _rentFocusNode = FocusNode();
FocusNode _commentFocusNode = FocusNode();

/// result
String _orientationSelected = '南';
TextEditingController _buildController = TextEditingController(
  text: '150.00',
);
TextEditingController _pragmaticController = TextEditingController(text: '');
TextEditingController _rentController = TextEditingController(text: '2222');
TextEditingController _commentController = TextEditingController(text: '');

String _roomSelected = '3';
String _livingRoomSelected = '1';
String _cookHouseSelected = '1';
String _toiletSelected = '2';

List<String> _propertiesSelected = <String>[
  '南北通透',
  '双卫生间',
  '主卧朝南',
];

/// 页面主入口
class EditPropertyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: EditProperty(),
    );
  }
}

class EditProperty extends StatefulWidget {
  @override
  PropertyState createState() => PropertyState();
}

class PropertyState extends State<EditProperty> implements EventsCallback {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context, _title),
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
    setState(() {
      _buildController.text = '150.00';
      _pragmaticController.text = '';
      _rentController.text = '2222';
      _commentController.text = '';
      _orientationSelected = '南';

      _roomSelected = '3';
      _livingRoomSelected = '1';
      _cookHouseSelected = '1';
      _toiletSelected = '2';
      _propertiesSelected = <String>[
        '南北通透',
        '双卫生间',
        '主卧朝南',
      ];
    });
  }

  void _showMsg(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('提交内容'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                new Text('建筑面积：' + _buildController.text),
                new Text('实用面积：' + _pragmaticController.text),
                new Text('朝向：' + _orientationSelected),
                new Text('房型：' +
                    '$_roomSelected室$_livingRoomSelected厅$_cookHouseSelected厨$_toiletSelected卫'),
                new Text('租价：' + _rentController.text),
                new Text('房源属性：$_propertiesSelected'),
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
  void selectOrientation(String newOrientation) {
    setState(() {
      _orientationSelected = newOrientation;
    });
  }

  @override
  void selectHouseType(HouseType type, String value) {
    setState(() {
      if (type == HouseType.Room) {
        _roomSelected = value;
        return;
      }
      if (type == HouseType.LivingRoom) {
        _livingRoomSelected = value;
        return;
      }
      if (type == HouseType.CookHouse) {
        _cookHouseSelected = value;
        return;
      }
      _toiletSelected = value;
    });
  }

  @override
  void selectProperties(List<String> result) {
    setState(() {
      _propertiesSelected = result;
    });
  }
}

class EditPropertyBody extends StatelessWidget {
  final EventsCallback callback;

  const EditPropertyBody(this.callback);

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    List<Widget> itemViews = List<Widget>();
    for (int i = 0; i < _propertiesSelected.length; i++) {
      itemViews.add(SquareLabel(
        bgColor: Color.fromARGB(222, 240, 240, 240),
        borderColor: Colors.red,
        textColor: Colors.red,
        text: _propertiesSelected[i],
        width: 70,
        height: 33,
        margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
      ));
    }

    GridView gridView = GridView(
      physics: new NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          childAspectRatio: 1.5),
      children: itemViews,
    );

    double height = 62 * (_propertiesSelected.length / 4).ceil().toDouble();
    print(height);

    print(RequestManager.getHeaders('Ceshigzywq', 'android'));

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
            SliverPadding(
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
            SliverPadding(
              padding: const EdgeInsets.all(0.0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                  <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: GestureDetector(
                        onTapUp: (tapUpDetails) {
                          _showOrientation(context, _orientationSelected);
                        },
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Text('朝向')),
                            Text(_orientationSelected),
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
                              SquareLabel(
                                bgColor: Color.fromARGB(222, 240, 240, 240),
                                borderColor: Colors.grey,
                                textColor: Colors.black,
                                text: _roomSelected,
                                margin: EdgeInsets.fromLTRB(0, 15, 10, 10),
                                tag: HouseType.Room,
                                tapUpCallback: (tapUpDetails) {
                                  _showHouseType(
                                      context, _roomSelected, HouseType.Room);
                                },
                              ),
                              Text('室'),
                              SquareLabel(
                                bgColor: Color.fromARGB(222, 240, 240, 240),
                                borderColor: Colors.grey,
                                textColor: Colors.black,
                                text: _livingRoomSelected,
                                margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
                                tapUpCallback: (tapUpDetails) {
                                  _showHouseType(context, _livingRoomSelected,
                                      HouseType.LivingRoom);
                                },
                              ),
                              Text('厅'),
                              SquareLabel(
                                bgColor: Color.fromARGB(222, 240, 240, 240),
                                borderColor: Colors.grey,
                                textColor: Colors.black,
                                text: _cookHouseSelected,
                                margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
                                tapUpCallback: (tapUpDetails) {
                                  _showHouseType(context, _cookHouseSelected,
                                      HouseType.CookHouse);
                                },
                              ),
                              Text('厨'),
                              SquareLabel(
                                bgColor: Color.fromARGB(222, 240, 240, 240),
                                borderColor: Colors.grey,
                                textColor: Colors.black,
                                text: _toiletSelected,
                                margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
                                tapUpCallback: (tapUpDetails) {
                                  _showHouseType(context, _toiletSelected,
                                      HouseType.Toilet);
                                },
                              ),
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
                          GestureDetector(
                            onTapUp: (tapUpDetails) {
                              _showProperties(context);
                            },
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Text('房源属性')),
                                Text('请选择'),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: height,
                            child: gridView,
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
            SliverPadding(
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
                    MultiInput(
                      focusNode: _commentFocusNode,
                      controller: _commentController,
                    ),
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

  void _showOrientation(BuildContext context, String selected) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSelectView(
          dataSource: _orientation,
          callback: callback,
          selected: selected,
        );
      },
    ).then((val) {
//      print(val);
    });
  }

  void _showHouseType(BuildContext context, String selected, HouseType type) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSelectView(
          dataSource: _houseCount,
          callback: callback,
          selected: selected,
          houseType: type,
        );
      },
    ).then((val) {
//      print(val);
    });
  }

  void _showProperties(BuildContext context) {
    List<String> dataSource = _properties;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomGridSelectView(
          dataSource: dataSource,
          callback: callback,
          selected: _propertiesSelected,
        );
      },
    ).then((val) {
//      print(val);
    });
  }
}
