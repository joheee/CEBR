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
      padding: const EdgeInsets.symmetric(
        vertical: 10.0
      ),
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
    
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FutureBuilder(
                        future: getImageFromStorage(room),
                        builder: (context, snapshot) {
                          return PhotoCardWidget(
                            url: snapshot.data ??
                                'https://www.cabinetmakerwarehouse.com/wp-content/uploads/9242-gull-grey.jpg',
                            height: 100.0,
                            width: 100.0,
                            borderRadius: 8.0,
                          );
                        }),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textTemplate(
                            room.roomName, fontColor, 18.0, 'PoppinsBold'),
                        TextWithIconWidget(
                            text: room.roomLocation,
                            icon: LineIcons.building,
                            offset: 10.0,
                            color: fontColor),
                        TextWithIconWidget(
                            text: room.roomFloor,
                            icon: LineIcons.mapMarker,
                            offset: 10.0,
                            color: fontColor),
                        TextWithIconWidget(
                            text: room.roomStatus == true
                                ? 'available'
                                : 'unavailable',
                            icon: room.roomStatus == true
                                ? LineIcons.checkCircle
                                : LineIcons.timesCircle,
                            offset: 10.0,
                            color: fontColor),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

class PhotoCardWidget extends StatelessWidget {
  const PhotoCardWidget(
      {super.key,
      required this.url,
      required this.height,
      required this.width,
      required this.borderRadius});

  final String url;
  final double height;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.network(url, fit: BoxFit.cover)),
    );
  }
}

class TextWithIconWidget extends StatelessWidget {
  TextWithIconWidget(
      {super.key,
      required this.text,
      required this.icon,
      required this.offset,
      required this.color,
      this.fontSize = 12.0,
      this.fontColor = Colors.black});

  final String text;
  final IconData icon;
  final double offset;
  final Color color;
  double fontSize;
  Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        SizedBox(width: offset),
        textTemplate(text, fontColor, fontSize, 'Poppins'),
      ],
    );
  }
}
