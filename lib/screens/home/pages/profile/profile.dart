import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/upload_post.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:plantgo_alpha/screens/home/pages/profile/profile_service.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';
import 'package:plantgo_alpha/screens/auth/firebase_operations.dart';
import 'package:plantgo_alpha/screens/auth/landing_page.dart';

class Profile extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreen,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
          },
          icon: Icon(EvaIcons.settings2Outline, color: kWhiteColor),
        ),
        actions: [
          IconButton(
              icon: Icon(EvaIcons.logOutOutline, color: kWhiteColor),
              onPressed: () {
                Provider.of<ProfileService>(context, listen: false)
                    .logOutDialog(context);
              }),
        ],
        backgroundColor: kDarkGreenColor,
        title: RichText(
          text: TextSpan(
              text: 'My ',
              style: TextStyle(
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Profile',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                )
              ]),
        ),
      ),
      body: SafeArea(
        child: ListView(
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            children: <Widget>[
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(Provider.of<AuthenticationService>(context,
                            listen: false)
                        .getUserUid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return new Column(
                      children: [
                        Provider.of<ProfileService>(context, listen: false)
                            .headerProfile(context, snapshot),
                        Provider.of<ProfileService>(context, listen: false)
                            .feedProfile(context, snapshot)
                      ],
                    );
                  }
                },
              ),
            ]),
      ),
    );
  }
}
