import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/models/plantico_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Stack(
                //Disini BROOOO PUSING YEUHHHHHHHH
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    height: 250,
                    color: kMainColor,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 70,
                        left: 160,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/sawi1.jpg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70, left: 150),
                    height: 180.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                            begin: FractionalOffset.centerRight,
                            end: FractionalOffset.centerLeft,
                            colors: [
                              Colors.green[50].withOpacity(0.0),
                              kMainColor,
                            ],
                            stops: [
                              0.5,
                              0.9
                            ])),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                        ),
                        child: Container(
                          height: 70.0,
                          margin: const EdgeInsets.only(
                              bottom: 6.0), //Same as `blurRadius` i guess
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5.5),
                              bottomRight: Radius.circular(5.5),
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                            ),
                            color: kDarkGreenColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 3.0,
                              ),
                            ],
                          ),
                          child: ListView.builder(
                              padding: EdgeInsets.only(left: 10, right: 5),
                              itemCount: planticos.length,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 15, bottom: 6),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: kMainColor.withOpacity(0),
                                    image: DecorationImage(
                                      image: AssetImage(planticos[index].image),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 22),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Card(
                      color: kMainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                        width: 140,
                        height: 80,
                        // button color
                        child: InkWell(
                          splashColor: Colors.lightBlue[100], // splash color
                          onTap: () {}, // button pressed

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/leaf.svg',
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              // icon
                              Text("Penanaman",
                                  style: GoogleFonts.roboto(
                                    fontSize: 17,
                                    color: Colors.white,
                                  )), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: kMainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                        width: 140,
                        height: 80,
                        child: InkWell(
                          splashColor: Colors.lightBlue[100], // splash color
                          onTap: () {}, // button pressed

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/bug.svg',
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              Text("Penyakit & Hama",
                                  style: GoogleFonts.roboto(
                                    fontSize: 17,
                                    color: Colors.white,
                                  )), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
