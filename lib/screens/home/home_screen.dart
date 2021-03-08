import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/home/auth/authentication_service.dart';
import 'package:plantgo_alpha/screens/home/pages/body.dart';
import 'package:plantgo_alpha/screens/home/pages/profile.dart';
import 'package:plantgo_alpha/screens/home/pages/forum.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _layoutPage = [Body(), Forum(), Profile()];

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
          "PlantGo ",
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
      drawer: Drawer(
        child: Column(
          // Changed this to a Column from a ListView
          children: <Widget>[
            _createHeader(),
            ListTile(title: Text('First item')),
            Expanded(
                child:
                    Container()), // Add this to force the bottom items to the lowest point
            Column(
              children: <Widget>[
                _createFooterItem(
                    icon: Icons.settings,
                    text: 'Settings',
                    onTap: () => Navigator.pushReplacementNamed(context, '/')),
                _createFooterItem(
                    icon: Icons.exit_to_app,
                    text: 'Logout',
                    onTap: () {
                      context.read<AuthenticationService>().signOut();
                    }),
              ],
            ),
          ],
        ),
      ),
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

Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/backgroundLogin2.png'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Flutter Step-by-Step",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
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
