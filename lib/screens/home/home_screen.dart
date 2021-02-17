import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/home/pages/body.dart';
import 'package:plantgo_alpha/screens/home/pages/profile.dart';
import 'package:plantgo_alpha/screens/home/pages/forum.dart';
import 'package:plantgo_alpha/screens/home/auth/login_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _layoutPage = [Body(), Forum(), LoginPage()];

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
          "PlantGo *alphX",
          style: GoogleFonts.allerta(
              fontSize: 18, fontWeight: FontWeight.bold, color: kWhiteColor),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            color: kWhiteColor,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: kDarkGreenColor,
        elevation: 0.0,
      ),
      drawer: Drawer(),
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: kDarkGreenColor,
        unselectedItemColor: kMainColor,
        selectedLabelStyle:
            TextStyle(color: kMainColor, fontFamily: 'Roboto', fontSize: 14.0),
        unselectedLabelStyle: TextStyle(
            color: Colors.grey[600], fontFamily: 'Roboto', fontSize: 12.0),
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.forum), title: Text('Forum')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('Profile')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
      ),
    );
  }
}
