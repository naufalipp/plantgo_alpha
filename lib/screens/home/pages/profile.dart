import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/models/plantico_model.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkGreenColor,
      ),
      body: SafeArea(
        child: Container(
          height: 100,
          color: kGreyColor,
        ),
      ),
    );
  }
}
