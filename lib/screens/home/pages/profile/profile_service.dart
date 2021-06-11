import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:plantgo_alpha/screens/home/pages/forum/post_function.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';

import 'package:plantgo_alpha/screens/auth/landing_page.dart';

class ProfileService with ChangeNotifier {
  Widget headerProfile(BuildContext context, dynamic snapshot) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 340,
              child: Stack(children: <Widget>[
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: kDarkGreenColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: CachedNetworkImage(
                          imageUrl: snapshot.data.data()['userimage'],
                          imageBuilder: (context, imageProvider) => Container(
                            width: 90.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kGreyColor.withOpacity(0.4),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(snapshot.data.data()['username'],
                            style: GoogleFonts.openSans(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100.0),
                        child: Divider(
                          thickness: 0.6,
                          color: kGreyColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        height: 70,
                        decoration: BoxDecoration(
                            color: kGreyColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10)),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(
                                                snapshot.data.data()['useruid'])
                                            .collection('posts')
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          } else {
                                            return new Text(
                                                snapshot.data.docs.length
                                                    .toString(),
                                                style: GoogleFonts.openSans(
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.bold));
                                          }
                                        }),
                                    SizedBox(height: 3),
                                    Text("Posts",
                                        style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                        )),
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                thickness: 0.3,
                                color: kWhiteColor.withOpacity(0.8),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(
                                                snapshot.data.data()['useruid'])
                                            .collection('followers')
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          } else {
                                            return new Text(
                                                snapshot.data.docs.length
                                                    .toString(),
                                                style: GoogleFonts.openSans(
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.bold));
                                          }
                                        }),
                                    SizedBox(height: 3),
                                    Text("Followers",
                                        style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                        )),
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                thickness: 0.3,
                                color: kWhiteColor.withOpacity(0.8),
                              ),
                              Container(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      StreamBuilder<QuerySnapshot>(
                                          stream: FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(snapshot.data
                                                  .data()['useruid'])
                                              .collection('following')
                                              .snapshots(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            } else {
                                              return new Text(
                                                  snapshot.data.docs.length
                                                      .toString(),
                                                  style: GoogleFonts.openSans(
                                                      color: Colors.white,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold));
                                            }
                                          }),
                                      SizedBox(height: 3),
                                      Text("Following",
                                          style: GoogleFonts.openSans(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                          )),
                                    ],
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
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 290,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: kLightGreen,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            padding: EdgeInsets.only(
                              bottom: 5, // Space between underline and text
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: kGreyColor,
                              width: 1.0, // Underline thickness
                            ))),
                            child: Text("Post Terbaru",
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget feedProfile(BuildContext context, dynamic snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(Provider.of<AuthenticationService>(context, listen: false)
                    .getUserUid)
                .collection('posts')
                .orderBy('time', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Flex(direction: Axis.horizontal, children: [
                  Expanded(
                    child: new ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: snapshot.data.docs
                          .map((DocumentSnapshot documentSnapshot) {
                        return GestureDetector(
                          onTap: () {
                            //showPostDetails(context, documentSnapshot);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Flex(direction: Axis.horizontal, children: [
                              Flexible(
                                child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, top: 4),
                                          child: Text(
                                            documentSnapshot.data()['title'],
                                            style: GoogleFonts.openSans(
                                                color: kBlackColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, top: 4),
                                          child: Text(
                                            documentSnapshot.data()['caption'],
                                            style: GoogleFonts.openSans(
                                                color: kBlackColor,
                                                fontSize: 14.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 4),
                                          child: Container(
                                            child: smallImage(
                                                context, documentSnapshot),
                                            height: 60,
                                            width: 120,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, left: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: 80.0,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onLongPress: () {
                                                        Provider.of<PostFunction>(
                                                                context,
                                                                listen: false)
                                                            .showLikes(
                                                                context,
                                                                documentSnapshot
                                                                        .data()[
                                                                    'title']);
                                                      },
                                                      onTap: () {
                                                        print('Adding like...');
                                                        Provider.of<PostFunction>(
                                                                context,
                                                                listen: false)
                                                            .addLike(
                                                                context,
                                                                documentSnapshot
                                                                        .data()[
                                                                    'title'],
                                                                Provider.of<AuthenticationService>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .getUserUid);
                                                      },
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .arrowAltCircleUp,
                                                        color: kGreyColor,
                                                        size: 18.0,
                                                      ),
                                                    ),
                                                    StreamBuilder<
                                                            QuerySnapshot>(
                                                        stream: FirebaseFirestore
                                                            .instance
                                                            .collection('posts')
                                                            .doc(
                                                                documentSnapshot
                                                                        .data()[
                                                                    'title'])
                                                            .collection('likes')
                                                            .snapshots(),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot
                                                                  .connectionState ==
                                                              ConnectionState
                                                                  .waiting) {
                                                            return Center(
                                                                child:
                                                                    CircularProgressIndicator());
                                                          } else {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          8.0),
                                                              child: Text(
                                                                snapshot.data
                                                                    .docs.length
                                                                    .toString(),
                                                                style: GoogleFonts
                                                                    .openSans(
                                                                        color:
                                                                            kGreyColor,
                                                                        fontSize:
                                                                            16.0),
                                                              ),
                                                            );
                                                          }
                                                        })
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Container(
                                                width: 150.0,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Provider.of<PostFunction>(
                                                                context,
                                                                listen: false)
                                                            .showComments(
                                                                context,
                                                                documentSnapshot,
                                                                documentSnapshot
                                                                        .data()[
                                                                    'title']);
                                                      },
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .solidComments,
                                                        color: kGreyColor,
                                                        size: 16.0,
                                                      ),
                                                    ),
                                                    StreamBuilder<
                                                            QuerySnapshot>(
                                                        stream: FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                ' posts')
                                                            .doc(
                                                                documentSnapshot
                                                                        .data()[
                                                                    'title'])
                                                            .collection(
                                                                'comments')
                                                            .snapshots(),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot
                                                                  .connectionState ==
                                                              ConnectionState
                                                                  .waiting) {
                                                            return Center(
                                                                child:
                                                                    CircularProgressIndicator());
                                                          } else {
                                                            print(
                                                                snapshot.data);
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          8.0),
                                                              child: Text(
                                                                snapshot.data
                                                                    .docs.length
                                                                    .toString(),
                                                                style: GoogleFonts
                                                                    .openSans(
                                                                        color:
                                                                            kGreyColor,
                                                                        fontSize:
                                                                            16.0),
                                                              ),
                                                            );
                                                          }
                                                        }),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: kWhiteColor.withOpacity(0.6))),
                              ),
                            ]),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ]);
              }
            }),
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

  Widget smallImage(BuildContext context, DocumentSnapshot documentSnapshot) =>
      FullScreenWidget(
        backgroundColor: kLightGreen,
        backgroundIsTransparent: true,
        child: Center(
          child: Hero(
            tag: documentSnapshot.data()['postimage'],
            child: CachedNetworkImage(
              imageUrl: documentSnapshot.data()['postimage'],
              imageBuilder: (context, imageProvider) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
}
