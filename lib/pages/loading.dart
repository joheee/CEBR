import 'package:cebr/config/variable.dart';
import 'package:cebr/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3));
    handleCurrentUser(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          color: primaryColor,
          size: 200,
        ),
      ),
    ));
  }
}
