import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:plantgo_alpha/models/data.dart';
import 'package:plantgo_alpha/screens/home/pages/plantdetails.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: kDefaultPadding * 1),
              // It will cover 20% of our total height
              height: 150,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      bottom: 36 + kDefaultPadding,
                    ),
                    height: 100,
                    decoration: BoxDecoration(
                      color: kDarkGreenColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Mari Berkebun dirumah',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 60,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: kDarkGreenColor.withOpacity(0.23),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                hintText: "Card bagian Weather 'nanti'",
                                hintStyle: TextStyle(
                                  color: kDarkGreenColor.withOpacity(0.5),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                // surffix isn't working properly  with SVG
                                // thats why we use row
                                // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              margin: EdgeInsets.only(left: 20, right: 14, bottom: 5),
              child: Text(
                '• Pilih berbagai macam tanaman yang anda inginkan',
                style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kDarkGreenColor),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: Data.tanaman.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 2, left: 16, right: 16, bottom: 8),
                    child: InkWell(
                      splashColor: kDarkGreenColor,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlantDetails(
                                      tanaman: Data.tanaman[index],
                                    )));
                      },
                      child: Card(
                          color: Color(Data.tanaman[index].color),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            height: 120,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 50,
                                        width: 60,
                                        child: Image(
                                          image: AssetImage(
                                              Data.tanaman[index].icon),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(Data.tanaman[index].title,
                                            style: GoogleFonts.allerta(
                                              fontSize: 17,
                                              color: Colors.black,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ShaderMask(
                                    shaderCallback: (rect) {
                                      return LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        colors: [
                                          Colors.black,
                                          Colors.transparent
                                        ],
                                      ).createShader(Rect.fromLTRB(
                                          0, 0, rect.width, rect.height));
                                    },
                                    blendMode: BlendMode.dstIn,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                      child: Hero(
                                        tag: Data.tanaman[index].id,
                                        child: FadeInImage(
                                          image: AssetImage(
                                              Data.tanaman[index].image),
                                          fit: BoxFit.cover,
                                          placeholder: AssetImage(
                                              'assets/images/loading-green.gif'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
