import 'package:flutter/material.dart';

TextStyle textStyle(double fontSize, Color? color) {
  return TextStyle(fontSize: fontSize, color: color ?? secondColor);
}

TextStyle titleStyle(double fontSize, Color? color) {
  return TextStyle(
      fontSize: fontSize,
      color: color ?? Colors.black,
      fontWeight: FontWeight.bold);
}

const standard = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
const small = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);
const secondColor = Color.fromARGB(255, 86, 85, 85);
var textColor = Colors.blue[100];
