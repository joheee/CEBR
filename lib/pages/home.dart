import 'package:cebr/widget/bottom_bar.dart';
import 'package:cebr/widget/home_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomeCardWidget(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
