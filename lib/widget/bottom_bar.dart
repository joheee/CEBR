
import 'package:cebr/config/logged_user.dart';
import 'package:cebr/config/variable.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

