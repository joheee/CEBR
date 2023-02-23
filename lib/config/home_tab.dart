import 'package:cebr/pages/home.dart';
import 'package:flutter/material.dart';

class HomeTab {

  static List<AppBar> displayAppBar = [
    templateAppBar('home'),
    templateAppBar('notification'),
    templateAppBar('others'),
    templateAppBar('admin privilege'),
  ];
}
