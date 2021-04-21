import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';

import 'package:plantgo_alpha/screens/auth/landing_page.dart';

class ProfileService with ChangeNotifier {
  Widget headerProfile(BuildContext context, dynamic snapshot) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: kDarkGreenColor.withOpacity(0.5),
                      radius: 60.0,
                      backgroundImage: snapshot.data.data()['userimage'] != null
                          ? NetworkImage(snapshot.data.data()['userimage'])
                          : AssetImage('assets/images/profilepic-default.jpg'),
                    ),
                    Positioned(
                        top: 90.0,
                        left: 90.0,
                        child: Icon(FontAwesomeIcons.plusCircle,
                            color: kWhiteColor))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(snapshot.data.data()['username'],
                      style: GoogleFonts.openSans(
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(EvaIcons.email, color: Colors.white, size: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(snapshot.data.data()['useremail'],
                            style: GoogleFonts.openSans(
                                color: kWhiteColor, fontSize: 16.0)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
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
}
