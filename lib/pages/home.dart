import 'package:cebr/config/logged_user.dart';
import 'package:cebr/config/variable.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: const [],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(color: primaryColor, boxShadow: [
            BoxShadow(
              color: secondaryColor.withOpacity(0.1),
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 5.0, //extend the shadow
              offset: const Offset(
                5.0, // Move to right 5  horizontally
                5.0, // Move to bottom 5 Vertically
              ),
            )
          ]),
          child: GNav(
              rippleColor: secondaryColor.withOpacity(0.2),
              hoverColor: secondaryColor.withOpacity(0.2),
              activeColor: secondaryColor,
              tabBackgroundColor: secondaryColor.withOpacity(0.2),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              tabActiveBorder:
                  Border.all(color: secondaryColor.withOpacity(0.5), width: 1),
              curve: Curves.easeInExpo,
              gap: 8,
              onTabChange: (index) {
                print(index);
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
              ]),
        ),
      ),
    );
  }
}
