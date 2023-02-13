import 'package:cebr/config/logged_user.dart';
import 'package:cebr/config/variable.dart';
import 'package:cebr/custom/text_component.dart';
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

Widget homeHeader() => SizedBox(
      height: 200,
      child: AppBar(
        backgroundColor: secondaryColor,
        title: textTemplate(LoggedUser.currFullName, primaryColor, 24, 'PoppinsSemiBold'),
        centerTitle: true,
        toolbarHeight: 120,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12.0)
          )
        ),
      ),
    );