import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';

import '../../home_screen.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreen,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: HomeScreen(), type: PageTransitionType.topToBottom));
          },
          icon: Icon(EvaIcons.arrowBack, color: kWhiteColor),
        ),
        backgroundColor: kDarkGreenColor,
        title: RichText(
          text: TextSpan(
              text: 'Tentang ',
              style: TextStyle(
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Pengembang',
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
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 1, 10, 10),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/icons/PlantGo_Logo-v1.png'))),
                        ),
                      ),
                      Container(
                        height: 170,
                        margin: EdgeInsets.fromLTRB(35, 1, 35, 1),
                        child: Text(
                          "Aplikasi ini dibuat untuk membantu orang-orang dalam bercocok tanam di rumah sendiri dengan metode sistem hidroponik dan cocok tanam di lahan sempit. Dengan adanya aplikasi ini masyarakat tidak perlu lagi mencari panduan di buku maupun bertanya secara langsung kepada orang lain",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 1, 35, 8),
                        child: Text(
                          "Aplikasi ini merupakan tugas akhir yang dibuat oleh pengembang dalam rangka memenuhi salah satu syarat untuk mencapai gelar sarjana. ",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 1, 35, 8),
                        child: Text(
                          "Perlu diketahui Isi dari fungsi dan panduan dalam bercocok tanam di dapatkan oleh pengembang melalui riset jurnal ilmiah, buku, serta laman di internet dan tidak 100% akurat, Pengmbang berusaha semaksimal mungkin dalam memberikan informasi.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Divider(
                          thickness: 1,
                          color: kMainColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 1, 35, 8),
                        child: Text(
                          "Salam",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 1, 35, 8),
                        child: Text(
                          "Pengembang",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: kBlackColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 1, 35, 8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            side: BorderSide(color: kDarkGreenColor),
                            primary: kLightGreen,
                            onPrimary: kLightGreen,
                            onSurface: kGreyColor,
                            elevation: 5.0,
                            padding: EdgeInsets.symmetric(
                                horizontal: 55, vertical: 5),
                          ),
                          onPressed: () {},
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 1, 10, 1),
                                child: Text(
                                  "Naufal Alip Pratama",
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: kBlackColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 60),
                                child: Divider(
                                  thickness: 0.5,
                                  color: kMainColor,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    EvaIcons.emailOutline,
                                    color: kBlackColor,
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 1, 5, 8),
                                    child: Text(
                                      "naufal211@gmail.com",
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: kBlackColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
