import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/home/pages/home/body.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/forum.dart';
import 'package:plantgo_alpha/screens/home/pages/profile/profile.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  final _layoutPage = [Body(), Profile(), Forum()];

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "PlantGo *alpha",
          style: GoogleFonts.allerta(
              fontSize: 18, fontWeight: FontWeight.bold, color: kWhiteColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: kWhiteColor,
          onPressed: () {},
        ),
        backgroundColor: kDarkGreenColor,
        elevation: 0.0,
      ),
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: kMainColor,
        unselectedItemColor: kDarkGreenColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Forum'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
      ),
    );
  }
}
