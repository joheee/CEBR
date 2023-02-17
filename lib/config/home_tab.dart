import 'package:cebr/config/logged_user.dart';
import 'package:cebr/pages/home.dart';
import 'package:cebr/widget/home_card.dart';
import 'package:cebr/widget/other_widget.dart';
import 'package:flutter/material.dart';

class HomeTab {
  static int index = 0;
  static List<Widget> displayTab = [
    const HomeCardWidget(),
    const Text('second tab'),
    const OtherCardWidget(),
    const Text('fourth tab'),
  ];
  static List<AppBar> displayAppBar = [
    templateAppBar(LoggedUser.currFullName ?? 'dummy username'),
    templateAppBar('notification'),
    templateAppBar('others'),
    templateAppBar('admin privilege'),
  ];
}
