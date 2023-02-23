import 'package:cebr/config/variable.dart';
import 'package:cebr/custom/text_component.dart';
import 'package:cebr/model/date_borrowing.dart';
import 'package:cebr/model/user.dart';
import 'package:cebr/widget/home_card.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cebr/firebase/firebase_util.dart';
import 'package:cebr/model/room.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:line_icons/line_icons.dart';

class NotificationCardWidget extends StatefulWidget {
  const NotificationCardWidget({super.key});

  @override
  State<NotificationCardWidget> createState() => _NotificationCardWidgetState();
}

class _NotificationCardWidgetState extends State<NotificationCardWidget> {
  Query roomQuery = databaseInstance.ref('rooms').orderByChild('roomName');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FirebaseAnimatedList(
          query: roomQuery,
          itemBuilder: (context, snapshot, animation, index) {
            Map data = snapshot.value as Map;
            data['key'] = snapshot.key;
            Room room = Room(
                roomName: data['key'],
                roomFloor: data['roomFloor'],
                roomLocation: data['roomLocation'],
                roomPhoto: data['roomPhoto'],
                roomStatus: data['roomStatus'],
                roomDateBorrowing: []);
            if (data['dateBorrowing'] != null) {
              data['dateBorrowing'].forEach((key, value) {
                DateBorrowing roomDateBorrowing = DateBorrowing(
                    borrowedDate: key,
                    borrowedPeople: value['borrowedPeople'],
                    borrowedPurpose: value['borrowedPurpose'],
                    borrower: value['borrower'],
                    borrowedTime: value['borrowedTime'],
                    isNotified: value['isNotified'],
                    isVerified: value['isVerified']);
                room.roomDateBorrowing!.add(roomDateBorrowing);
              });
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: room.roomDateBorrowing!.length,
              itemBuilder: (context, index) {
                DateBorrowing currDate = room.roomDateBorrowing![index];
                return FutureBuilder(
                  future: firestoreInstance
                      .collection('users')
                      .doc(currDate.borrower)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      UserCebr user = UserCebr(
                          userEmail: snapshot.data!.id,
                          fullname: snapshot.data!.data()!['fullname'],
                          role: snapshot.data!.data()!['role'],
                          studentId: snapshot.data!.data()!['student_id']);
                      return EachCardNotificationWidget(
                          room: room, user: user, currDate: currDate);
                    }
                    return const SizedBox();
                  },
                );
              },
            );
          }),
    );
  }
}

class EachCardNotificationWidget extends StatefulWidget {
  const EachCardNotificationWidget({
    super.key,
    required this.room,
    required this.user,
    required this.currDate,
  });

  final Room room;
  final UserCebr user;
  final DateBorrowing currDate;

  @override
  State<EachCardNotificationWidget> createState() =>
      _EachCardNotificationWidgetState();
}

class _EachCardNotificationWidgetState
    extends State<EachCardNotificationWidget> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpened = !isOpened;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Card(
          color: notificationFillColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: notificationBorderColor, width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeaderNotificationCardWidget(
                    room: widget.room,
                    user: widget.user,
                    currDate: widget.currDate,
                    isOpened: isOpened),
                isOpened == false
                    ? const SizedBox()
                    : TableNotificationCardWidget(
                        room: widget.room, currDate: widget.currDate),
                isOpened == false
                    ? const SizedBox()
                    : FooterNotificationCardWidget(
                        currDate: widget.currDate, isOpened: isOpened)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FooterNotificationCardWidget extends StatelessWidget {
  const FooterNotificationCardWidget(
      {super.key, required this.currDate, required this.isOpened});

  final DateBorrowing currDate;
  final bool isOpened;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            textTemplate(
                currDate.borrowedDate, fontColor, 12.0, 'PoppinsSemiBold'),
            const SizedBox(
              width: 5.0,
            ),
            isOpened == false
                ? const Icon(LineIcons.angleLeft)
                : const Icon(LineIcons.angleRight)
          ],
        )
      ],
    );
  }
}

class TableNotificationCardWidget extends StatelessWidget {
  const TableNotificationCardWidget({
    super.key,
    required this.room,
    required this.currDate,
  });

  final Room room;
  final DateBorrowing currDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 11.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color: primaryColor,
          border: Border.all(color: notificationBorderColor)),
      width: double.infinity,
      child: DataTable(
        columns: [
          dataTableColumnHeader('Information'),
          dataTableColumnHeader('Data'),
        ],
        rows: [
          dataTableRowFill('Room', room.roomName),
          dataTableRowFill('People', currDate.borrowedPeople.toString()),
          dataTableRowFill('Purpose', currDate.borrowedPurpose),
          dataTableRowFill('Date', currDate.borrowedDate),
          dataTableRowFill('Time', currDate.borrowedTime),
        ],
      ),
    );
  }
}

DataRow dataTableRowFill(String information, String data) {
  return DataRow(
    cells: [
      DataCell(textTemplate(information, fontColor, 12.0, 'PoppinsSemiBold')),
      DataCell(textTemplate(data, fontColor, 12.0, 'PoppinsSemiBold'))
    ],
  );
}

DataColumn dataTableColumnHeader(String label) {
  return DataColumn(
      label: Expanded(
    child: textTemplate(label, fontColor, 14.0, 'PoppinsBold'),
  ));
}

class HeaderNotificationCardWidget extends StatelessWidget {
  const HeaderNotificationCardWidget(
      {super.key,
      required this.room,
      required this.user,
      required this.currDate,
      required this.isOpened});

  final bool isOpened;
  final Room room;
  final UserCebr user;
  final DateBorrowing currDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
            future: room.getImageFromStorage(),
            builder: (context, snapshot) {
              return PhotoCardWidget(
                url: snapshot.data ??
                    'https://www.cabinetmakerwarehouse.com/wp-content/uploads/9242-gull-grey.jpg',
                height: 80.0,
                width: 80.0,
                borderRadius: 8.0,
              );
            }),
        const SizedBox(
          width: 11.0,
        ),
        Expanded(
            child: Container(
              constraints: const BoxConstraints(
                maxHeight: 60.0
              ),
              child: Column
              (
                children: [
                  textTemplate(
                      '${user.fullname} (${user.studentId}) has requested to borrow ${room.roomName}',
                      fontColor,
                      14.0,
                      'PoppinsSemiBold'),
                  const Spacer(),
                  isOpened == true
                      ? const SizedBox()
                      : FooterNotificationCardWidget(
                          currDate: currDate, isOpened: isOpened)
              ]
            ),
          )
        ),
      ],
    );
  }
}
