import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';

import '../../home_screen.dart';

class Legal extends StatelessWidget {
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
              text: 'Term & ',
              style: TextStyle(
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Use',
                  style: TextStyle(
                    color: kWhiteColor,
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
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/icons/PlantGo_Logo-v1.png'))),
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
                        height: 30,
                        margin: EdgeInsets.fromLTRB(35, 1, 35, 1),
                        child: Text(
                          "Disclaimer! ",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: Colors.amber[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 170,
                        margin: EdgeInsets.fromLTRB(35, 1, 35, 1),
                        child: Text(
                          "Semua material yang berada dalam bentuk gambar, illustrasi dimiliki oleh para pemiliknya yang pengembang hormati. Pengembang tidak mengklaim gambar, illustrasi mereka sebagai milik pengembang. Gambar, Illustrasi yang digunakan dalam penjelasan adalah sebatas visualisasi.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 120,
                        margin: EdgeInsets.fromLTRB(35, 1, 35, 1),
                        child: Text(
                          "Dengan menggunakan aplikasi ini Pengguna dinyatakan setuju dan bertanggung jawab atas tindakan dan data apapun dalam apa yang dimasukan, diunggah dalam layanan komunitas",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 90,
                        margin: EdgeInsets.fromLTRB(35, 1, 35, 1),
                        child: Text(
                          "Setiap gambar dan atau tulisan yang diunggah oleh Pengguna harus mematuhi peraturan dan perundang undangan yang berlaku termasuk diantaranya:",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(50, 1, 35, 8),
                        child: Row(children: [
                          Text(
                            "○",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: kBlackColor,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              "Tulisan dan gambar yang diunggah tidak boleh mengandung/menampilkan unsur suku, agama, ras, antar-golongan (SARA).",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                color: kBlackColor,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(50, 1, 35, 8),
                        child: Row(children: [
                          Text(
                            "○",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: kBlackColor,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              "Tulisan dan gambar yang diunggah tidak boleh mengandung kepentingan politik praktis, pencemaran nama baik dan pornografi.",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                color: kBlackColor,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(50, 1, 35, 8),
                        child: Row(children: [
                          Text(
                            "○",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: kBlackColor,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              "Tulisan dan gambar yang diunggah tidak boleh menampilkan/ memperlihatkan rokok atau kegiatan merokok dan minuman keras.",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                color: kBlackColor,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(50, 1, 35, 8),
                        child: Row(children: [
                          Text(
                            "○",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: kBlackColor,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              "Tulisan dan gambar yang diunggah tidak boleh menampilkan gambar senjata api, senjata tajam, unsur sadisme, dan kekerasan secara eksplisit",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                color: kBlackColor,
                              ),
                            ),
                          ),
                        ]),
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
