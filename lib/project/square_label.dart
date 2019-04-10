import 'package:flutter/material.dart';

class SquareLabel extends StatelessWidget {
  final Color borderColor;
  final Color bgColor;
  final Color textColor;
  final String text;
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final GestureTapUpCallback tapUpCallback;
  final Object tag;

  const SquareLabel(
      {Key key,
        this.bgColor,
        this.borderColor,
        this.textColor,
        this.text,
        this.width = 50,
        this.height = 30,
        this.margin,
        this.tapUpCallback,
        this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: tapUpCallback,
      child: Container(
        alignment: Alignment.center,
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 0.5),
          color: bgColor,
        ),
        child: Text(
          '$text',
          style: TextStyle(color: textColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}