import 'package:cebr/config/variable.dart';
import 'package:flutter/material.dart';

Widget loginHeader(Widget child, double height) => Container(
      height: height,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0))),
      child: Center(
        child: child,
      ),
    );
