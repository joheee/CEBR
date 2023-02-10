import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cebr/config/variable.dart';
import 'package:cebr/firebase_options.dart';
import 'package:cebr/custom/banner_component.dart';
import 'package:cebr/view/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: splashScreen(),
      ),
    );
  }
}

Widget splashScreen() => AnimatedSplashScreen(
    splash: ceirCircle(),
    splashIconSize: 270.0,
    duration: 2000,
    backgroundColor: secondaryColor,
    nextScreen: const LoginPage());
