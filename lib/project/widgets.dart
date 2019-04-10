import 'package:flutter/material.dart';

class FragmentDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 245, 245, 240),
      height: 10.0,
    );
  }
}

class MultiInput extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;

  const MultiInput({this.focusNode, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        color: Color.fromARGB(222, 240, 240, 240),
        child: Theme(
          data: new ThemeData(
            primaryColor: Color.fromARGB(255, 222, 222, 222),
            hintColor: Color.fromARGB(255, 222, 222, 222),
          ),
          child: TextField(
            focusNode: focusNode,
            controller: controller,
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