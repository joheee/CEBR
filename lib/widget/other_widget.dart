import 'package:cebr/config/variable.dart';
import 'package:cebr/custom/text_component.dart';
import 'package:cebr/firebase/firebase_util.dart';
import 'package:cebr/pages/faq.dart';
import 'package:cebr/pages/login.dart';
import 'package:cebr/widget/home_card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:line_icons/line_icons.dart';

class OtherCardWidget extends StatefulWidget {
  const OtherCardWidget({super.key});
  @override
  State<OtherCardWidget> createState() => _OtherCardWidgetState();
}

const double fontSize = 15.0;

class _OtherCardWidgetState extends State<OtherCardWidget> {
  void handleFaQ() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const FaqPage()));
  }
  void handleNotificationLog() {

  }
  void handleLogRoom() {

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          OtherButtonWidget(
              textWithIconWidget: TextWithIconWidget(
                icon: LineIcons.inbox,
                text: 'Notification Log',
                offset: 10.0,
                iconColor: fontColor.withOpacity(0.5),
                fontSize: fontSize,
                fontColor: fontColor.withOpacity(0.6),
              ),
              function: () {
                handleNotificationLog();
              }),
          OtherButtonWidget(
              textWithIconWidget: TextWithIconWidget(
                icon: LineIcons.archive,
                text: 'Log Room',
                offset: 10.0,
                iconColor: fontColor.withOpacity(0.5),
                fontSize: fontSize,
                fontColor: fontColor.withOpacity(0.6),
              ),
              function: () {
                handleLogRoom();
              }),
          OtherButtonWidget(
              textWithIconWidget: TextWithIconWidget(
                icon: LineIcons.questionCircle,
                text: 'FaQ',
                offset: 10.0,
                iconColor: fontColor.withOpacity(0.5),
                fontSize: fontSize,
                fontColor: fontColor.withOpacity(0.6),
              ),
              function: () {
                handleFaQ();
              }),
          const SizedBox(height: 40.0),
          ElevatedButton(
              onPressed: () {
                authInstance.signOut().then((value) {

                  Navigator.of(context).pushReplacement(PageTransition(
                      child:
                          const MaterialApp(debugShowCheckedModeBanner: false,home: Scaffold(body: LoginPage())),
                      type: PageTransitionType.fade));
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: redAccentColor,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              child: textTemplate(
                  'Sign Out', Colors.white, 12.0, 'PoppinsSemiBold')),
        ]));
  }
}

class OtherButtonWidget extends StatelessWidget {
  const OtherButtonWidget(
      {super.key, required this.textWithIconWidget, required this.function});

  final TextWithIconWidget textWithIconWidget;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: fontColor.withOpacity(0.4), width: 2))),
      child: TextButton(onPressed: function, child: textWithIconWidget),
    );
  }
}
