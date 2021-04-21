import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/auth/landing_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: LandingPage(), type: PageTransitionType.leftToRight)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logover3-shadow.png'))),
          ),
          RichText(
            text: TextSpan(
                text: 'Plant',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: kWhiteCalm,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Go',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
