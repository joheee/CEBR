// ignore_for_file: use_build_context_synchronously, unused_catch_clause

import 'package:cebr/config/logged_user.dart';
import 'package:cebr/custom/notification_component.dart';
import 'package:cebr/custom/snack_bar/content_type.dart';
import 'package:cebr/firebase/firebase_util.dart';
import 'package:cebr/pages/home.dart';
import 'package:cebr/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void handleLogin(
    BuildContext context, String binusianEmailText, String passwordText) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: binusianEmailText, password: passwordText);
  } on FirebaseAuthException catch (e) {
    notificationSnackBar(
        context, 'oh snap!', 'invalid credentials :)', ContentType.failure);
    return;
  }
  notificationSnackBar(
      context, 'success login!', 'hola user!', ContentType.success);
  handleCurrentUser(context);
}

void handleCurrentUser(BuildContext context) {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      final currUser = firestoreInstance.collection('users').doc(user.email);
      currUser.get().then((value) {
        final data = value.data();
        LoggedUser.currEmail = user.email;
        LoggedUser.currRole = data!['role'];
        LoggedUser.currFullName = data['fullname'];
        LoggedUser.currStudentId = data['student_id'];
        Navigator.of(context).pushReplacement(PageTransition(child: const HomePage(), type: PageTransitionType.fade));
      });
    } else {
      Navigator.of(context).pushReplacement(PageTransition(
          child: const MaterialApp(home: Scaffold(body: LoginPage())),
          type: PageTransitionType.fade));
    }
  });
}
