import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:plantgo_alpha/screens/home/pages/forum/post_function.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';

import 'package:plantgo_alpha/screens/auth/landing_page.dart';

class PostDetails with ChangeNotifier {
  Widget postDetails(BuildContext context, DocumentSnapshot documentSnapshot) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        color: kLightGreen,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4),
              child: Text(
                documentSnapshot.data()['title'],
                style: GoogleFonts.openSans(
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4),
              child: Text(
                documentSnapshot.data()['caption'],
                style: GoogleFonts.openSans(color: kBlackColor, fontSize: 14.0),
              ),
            ),
            Container(
                height: 40,
                width: 40,
                child: FittedBox(
                  child: Image.network(documentSnapshot.data()['postimage']),
                )),
          ],
        ),
      ),
    );
  }
}
