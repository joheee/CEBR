import 'package:cebr/config/variable.dart';
import 'package:cebr/custom/text_component.dart';
import 'package:cebr/custom/banner_component.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
          backgroundColor: primaryColor,
          body: Stack(
            children: [
              Positioned(child: loginHeader()),
              Positioned(
                child: Center(
                    child: SizedBox(
                  child: Card(
                      margin: const EdgeInsets.all(31.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Container(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            textTemplate(
                                'Sign In', Colors.black, 16.0, 'PoppinsBold'),
                            const SizedBox(
                              height: 32,
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                  labelText: 'Binusian Email',
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(height: 14),
                            const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(height: 14),
                            textTemplate('pass beda', Colors.red, 12.0,
                                'PoppinsRegular'),
                            const SizedBox(height: 14),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: secondaryColor,
                                    minimumSize: const Size.fromHeight(50)),
                                child: textTemplate('Sign In', Colors.white,
                                    12.0, 'PoppinsSemiBold')),
                          ],
                        ),
                      )),
                )),
              )
            ],
          )),
    );
  }
}

Widget loginHeader() => Container(
      height: 300,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0))),
      child: Center(
        child: ceirText(),
      ),
    );
