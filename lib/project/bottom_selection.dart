import 'package:flutter/material.dart';
import 'event_callback.dart';
import 'square_label.dart';
import 'house_type.dart';

class BottomGridSelectView extends StatefulWidget {
  final List<String> dataSource;
  final EventsCallback callback;
  final List<String> selected;

  const BottomGridSelectView({Key key, this.dataSource, this.callback, this.selected})
      : super(key: key);

  @override
  _BottomGridSelectViewState createState() => _BottomGridSelectViewState();
}

class _BottomGridSelectViewState extends State<BottomGridSelectView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> itemViews = List<Widget>();

    for (int i = 0; i < widget.dataSource.length; i++) {
      bool contains = widget.selected.contains(widget.dataSource[i]);

      itemViews.add(SquareLabel(
        bgColor: Color.fromARGB(222, 240, 240, 240),
        borderColor: contains ? Colors.red : Colors.grey,
        textColor: contains ? Colors.red : Colors.black,
        text: widget.dataSource[i],
        width: 70,
        height: 33,
        margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
        tapUpCallback: (tapUpDetails) {
          setState(() {
            if (contains) {
              widget.selected.remove(widget.dataSource[i]);
              return;
            }
            widget.selected.add(widget.dataSource[i]);
          });
        },
      ));
    }

    Container container = Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                  childAspectRatio: 1.5),
              children: itemViews,
            ),
          ),
//          FragmentDivider(),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 5, 20, 35),
                  child: FlatButton(
                      padding: EdgeInsets.all(15),
                      color: Color.fromARGB(100, 222, 222, 222),
                      child: Text(
                        '取消',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 30, 35),
                  child: FlatButton(
                      padding: EdgeInsets.all(15),
                      color: Color.fromARGB(100, 222, 222, 222),
                      child: Text(
                        '确定',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        widget.callback.selectProperties(widget.selected);
                        Navigator.pop(context);
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    GestureDetector gestureDetector = GestureDetector(
      onTapUp: (tapUpDetails) {},
      child: container,
    );

    return gestureDetector;
  }
}


class BottomSelectView extends StatelessWidget {
  final List<String> dataSource;
  final EventsCallback callback;
  final String selected;
  final HouseType houseType;

  const BottomSelectView(
      {Key key, this.dataSource, this.callback, this.selected, this.houseType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListView listView = ListView.builder(
        itemCount: dataSource.length,
        itemBuilder: (BuildContext context, int index) {
          String value = dataSource[index];
          return ListTile(
//            leading: Icon(Icons.account_circle),
            title: Text(
              value,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              if (houseType != null) {
                callback.selectHouseType(houseType, value);
              } else {
                callback.selectOrientation(value);
              }

              Navigator.pop(context);
            },
            selected: value == selected,
          );
        });

    return Container(
      padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
      alignment: Alignment.center,
      child: listView,
    );
  }
}