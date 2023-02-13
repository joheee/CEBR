import 'package:cebr/config/variable.dart';
import 'package:cebr/custom/header_component.dart';
import 'package:cebr/custom/input_component.dart';
import 'package:cebr/custom/text_component.dart';
import 'package:cebr/firebase/firebase_util.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeCardWidget extends StatefulWidget {
  const HomeCardWidget({
    super.key,
  });

  @override
  State<HomeCardWidget> createState() => _HomeCardWidgetState();
}

class _HomeCardWidgetState extends State<HomeCardWidget> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    Query rooms = databaseInstance.child('rooms');
    rooms.onValue.listen((event) {
      final data = event.snapshot.value as Map;
      data['key'] = event.snapshot.key;
      print(data);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        homeHeader(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 100),
              constraints: const BoxConstraints(maxWidth: 600),
              child: Card(
                margin: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      textTemplate('Find a room at BINUS Syahdan',
                          searchBubbleColor, 14.0, 'PoppinsBold'),
                      const SizedBox(height: 15),
                      textFieldInput(search, 'search rooms', false),
                      const SizedBox(height: 15),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor,
                              minimumSize: const Size.fromHeight(50)),
                          child: textTemplate('Search Room', Colors.white, 12.0,
                              'PoppinsSemiBold')),
                    ],
                  ),
                ),
              ),
            ),
            const Card(
              margin: EdgeInsets.only(left: 31, right: 31, top: 25, bottom: 20),
            )
          ],
        ),
      ],
    );
  }
}
