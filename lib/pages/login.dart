import 'package:cebr/config/logged_user.dart';
import 'package:cebr/config/variable.dart';
import 'package:cebr/controller/login_controller.dart';
import 'package:cebr/custom/header_component.dart';
import 'package:cebr/custom/input_component.dart';
import 'package:cebr/custom/text_component.dart';
import 'package:cebr/custom/banner_component.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final binusianEmail = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    binusianEmail.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    LoggedUser.currEmail = LoggedUser.currFullName =
        LoggedUser.currRole = LoggedUser.currStudentId = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          loginHeader(ceirText(), 300),
          Container(
              padding: const EdgeInsets.only(top: 200),
              child: Card(
                margin: const EdgeInsets.all(30.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      textTemplate(
                          'Sign In', Colors.black, 16.0, 'PoppinsBold'),
                      const SizedBox(height: 30),
                      textFieldInput(binusianEmail, 'Binusian Email', false),
                      const SizedBox(height: 14),
                      textFieldInput(password, 'Password', true),
                      const SizedBox(height: 14),
                      ElevatedButton(
                          onPressed: () {
                            handleLogin(
                                context, binusianEmail.text, password.text);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor,
                              minimumSize: const Size.fromHeight(50)),
                          child: textTemplate('Sign In', Colors.white, 12.0,
                              'PoppinsSemiBold')),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
