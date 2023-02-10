import 'package:cebr/config/variable.dart';
import 'package:cebr/custom/text_component.dart';
import 'package:flutter/material.dart';


Widget ceirCircle() => CircleAvatar(
    backgroundColor: primaryColor.withOpacity(0.1),
    radius: 135,
    child: ceirText());

Widget ceirText() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        textTemplate('CEBR', Colors.white, 24.0, 'PoppinsBold'),
        textTemplate(
            'Computer Engineering', Colors.white, 12.0, 'PoppinsRegular'),
        textTemplate('Borrowing Room', Colors.white, 12.0, 'PoppinsRegular'),
      ],
    );
