import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';

import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';
import 'package:plantgo_alpha/screens/home/pages/home/body.dart';
import 'package:plantgo_alpha/screens/home/pages/profile/profile.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/forum.dart';
import 'package:plantgo_alpha/screens/auth/firebase_operations.dart';
import 'package:plantgo_alpha/screens/auth/landing_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    Provider.of<FirebaseOperations>(context, listen: false)
        .initUserData(context);
    super.initState();
  }

  final _layoutPage = [Body(), Forum(), Profile()];

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          BottomNavigationBarItem(icon: Icon(EvaIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.messageSquare), label: 'Forum'),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
      ),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: kWhiteCalm,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/backgroundLogin2.png'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("PlantGo",
                style: GoogleFonts.openSans(
                    color: Colors.amber,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold))),
      ]));
}

Widget _createFooterItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}

logOutDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kDarkGreenColor,
          title: Text('Log Out?',
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold)),
          actions: [
            MaterialButton(
                child: Text('No',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        decoration: TextDecoration.underline,
                        decorationColor: kWhiteColor)),
                onPressed: () {
                  Navigator.pop(context);
                }),
            MaterialButton(
                color: Colors.red,
                child: Text('Yes',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    )),
                onPressed: () {
                  Provider.of<AuthenticationService>(context, listen: false)
                      .logOutViaEmail()
                      .whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: LandingPage(),
                            type: PageTransitionType.bottomToTop));
                  });
                })
          ],
        );
      });
}
