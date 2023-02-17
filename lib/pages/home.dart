import 'package:cebr/config/home_tab.dart';
import 'package:cebr/config/logged_user.dart';
import 'package:cebr/config/variable.dart';
import 'package:cebr/custom/text_component.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: HomeTab.displayAppBar[HomeTab.index],
        body: HomeTab.displayTab[HomeTab.index],
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(color: primaryColor, boxShadow: [
            BoxShadow(
              color: secondaryColor.withOpacity(0.1),
              blurRadius: 15.0,
              spreadRadius: 5.0,
              offset: const Offset(5.0, 5.0),
            )
          ]),
          child: GNav(
            rippleColor: secondaryColor.withOpacity(0.2),
            hoverColor: secondaryColor.withOpacity(0.2),
            activeColor: secondaryColor,
            tabBackgroundColor: secondaryColor.withOpacity(0.2),
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            tabActiveBorder:
              Border.all(color: secondaryColor.withOpacity(0.5), width: 1.0),
          curve: Curves.easeInExpo,
          gap: 8.0,
          onTabChange: (index) {
            setState(() {
              HomeTab.index = index;
            });
          },
          tabs: [
            const GButton(
              icon: LineIcons.home,
              text: 'Home',
            ),
            const GButton(
              icon: LineIcons.bell,
              text: 'Notify',
            ),
            const GButton(
              icon: LineIcons.archive,
              text: 'Others',
            ),
            if (LoggedUser.currRole == 'admin')
              const GButton(
                icon: LineIcons.tools,
                text: 'Admin',
              ),
            ]
          ),
        )
      ),
    );
  }
}

AppBar templateAppBar(String text) {
  return AppBar(
    backgroundColor: secondaryColor,
    centerTitle: true,
    title: textTemplate(text, primaryColor, 20.0, 'PoppinsBold'),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(12.0),
      bottomRight: Radius.circular(12.0))),
  );
}

