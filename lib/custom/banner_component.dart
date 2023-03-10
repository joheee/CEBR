import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cebr/config/variable.dart';
import 'package:cebr/custom/text_component.dart';
import 'package:cebr/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


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
            'Computer Engineering', Colors.white, 16.0, 'PoppinsRegular'),
        textTemplate('Borrowing Room', Colors.white, 16.0, 'PoppinsRegular')]);

Widget cebrSplashScreen() => AnimatedSplashScreen(
      splash: ceirCircle(),
      splashIconSize: 270.0,
      duration: 2000,
      backgroundColor: secondaryColor,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      nextScreen: const MaterialApp(debugShowCheckedModeBanner: false,home: Scaffold(body: LoadingPage())));