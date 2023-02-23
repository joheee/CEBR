import 'package:flutter/material.dart';

Widget textFieldInput(TextEditingController controller, String labelText, bool obscureText) =>
    TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText, border: const OutlineInputBorder()),
    );
