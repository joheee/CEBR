import 'package:flutter/material.dart';

Widget textTemplate(textParam, fontColor, fontSize, fontFamily) => Text(
  textParam,
  style: TextStyle(
    color: fontColor,
    fontSize: fontSize,
    fontFamily: fontFamily
  ),
);