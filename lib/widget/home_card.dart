import 'package:cebr/config/variable.dart';
import 'package:cebr/custom/text_component.dart';
import 'package:cebr/firebase/firebase_util.dart';
import 'package:cebr/model/room.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomeCardWidget extends StatefulWidget {
  const HomeCardWidget({
    super.key,
  });

  @override
  State<HomeCardWidget> createState() => _HomeCardWidgetState();
}

class _HomeCardWidgetState extends State<HomeCardWidget> {
  Query roomQuery = databaseInstance.ref('rooms').orderByChild('roomName');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FirebaseAnimatedList(
        query: roomQuery,
        itemBuilder: (context, snapshot, animation, index) {
          Map data = snapshot.value as Map;
          data['key'] = snapshot.key;
          Room room = Room(
              roomName: data['key'] ?? 'dummy',
              roomFloor: data['roomFloor'] ?? 'dummy',
              roomLocation: data['roomLocation'] ?? 'dummy',
              roomPhoto: data['roomPhoto'] ?? 'dummy',
              roomStatus: data['roomStatus'] ?? false);
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                          'https://global.binus.ac.id/files/2021/05/SYAHDAN-NEW.jpg',
                          fit: BoxFit.cover)),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textTemplate(room.roomName, fontColor, 18.0, 'PoppinsBold'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(LineIcons.building),
                        const SizedBox(width: 10.0),
                        textTemplate(room.roomLocation, fontColor, 12.0, 'Poppins'),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(LineIcons.mapMarker),
                        const SizedBox(width: 10.0),
                        textTemplate(room.roomFloor, fontColor, 12.0, 'Poppins'),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(room.roomStatus == true ? LineIcons.checkCircle : LineIcons.timesCircle),
                        const SizedBox(width: 10.0),
                        textTemplate(room.roomStatus == true ? 'available' : 'unavailable', fontColor, 12.0, 'Poppins'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ));
        }),
    );
  }
}