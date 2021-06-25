import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantgo_alpha/screens/auth/landing_page.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/forum.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:plantgo_alpha/screens/home/pages/mutual_profile/mutual_profile.dart';
import 'package:plantgo_alpha/screens/home/home_screen.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';
import 'package:plantgo_alpha/screens/auth/firebase_operations.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/post_function.dart';

class MutualProfileService with ChangeNotifier {
  Widget appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: kWhiteCalm),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  child: HomeScreen(), type: PageTransitionType.leftToRight));
        },
      ),
      backgroundColor: kMainColor,
      centerTitle: true,
      title: RichText(
        text: TextSpan(
            text: 'Plant',
            style: TextStyle(
                color: kWhiteCalm, fontWeight: FontWeight.bold, fontSize: 20.0),
            children: <TextSpan>[
              TextSpan(
                text: ' Go',
                style: TextStyle(
                    color: kDarkGreenColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              )
            ]),
      ),
    );
  }

  Widget headerProfile(BuildContext context,
      AsyncSnapshot<DocumentSnapshot> snapshot, String userUid) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.48,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 390,
              child: Stack(children: <Widget>[
                Container(
                  height: 340,
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
                      //usermail
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
                              GestureDetector(
                                onTap: () {
                                  checkFollowersSheet(context, snapshot);
                                },
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      StreamBuilder<QuerySnapshot>(
                                          stream: FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(snapshot.data
                                                  .data()['useruid'])
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
                              ),
                              VerticalDivider(
                                thickness: 0.3,
                                color: kWhiteColor.withOpacity(0.8),
                              ),
                              GestureDetector(
                                onTap: () {
                                  checkFollowingSheet(context, snapshot);
                                },
                                child: Container(
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
                      SizedBox(height: 10),
                      MaterialButton(
                          color: kLightGreen.withOpacity(0.4),
                          padding: EdgeInsets.symmetric(
                              horizontal: 55, vertical: 10),
                          child: Text('Follow',
                              style: TextStyle(
                                  color: kWhiteCalm,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0)),
                          onPressed: () {
                            Provider.of<FirebaseOperations>(context,
                                    listen: false)
                                .followUser(
                                    userUid,
                                    Provider.of<AuthenticationService>(context,
                                            listen: false)
                                        .getUserUid,
                                    {
                                      'username':
                                          Provider.of<FirebaseOperations>(
                                                  context,
                                                  listen: false)
                                              .getInitUserName,
                                      'userimage':
                                          Provider.of<FirebaseOperations>(
                                                  context,
                                                  listen: false)
                                              .getInitUserImage,
                                      'useruid':
                                          Provider.of<AuthenticationService>(
                                                  context,
                                                  listen: false)
                                              .getUserUid,
                                      'useremail':
                                          Provider.of<FirebaseOperations>(
                                                  context,
                                                  listen: false)
                                              .getInitUserEmail,
                                      'time': Timestamp.now()
                                    },
                                    Provider.of<AuthenticationService>(context,
                                            listen: false)
                                        .getUserUid,
                                    userUid,
                                    {
                                      'username':
                                          snapshot.data.data()['username'],
                                      'userimage':
                                          snapshot.data.data()['userimage'],
                                      'useremail':
                                          snapshot.data.data()['useremail'],
                                      'useruid':
                                          snapshot.data.data()['useruid'],
                                      'time': Timestamp.now()
                                    })
                                .whenComplete(() {
                              followedNotification(
                                  context, snapshot.data.data()['username']);
                            });
                          }),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 330,
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

  Widget divider() {
    return Center(
      child: SizedBox(
        height: 15.0,
        width: 350.0,
        child: Divider(
          color: kWhiteCalm,
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
                .doc(snapshot.data.data()['useruid'])
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
                                                            .collection('posts')
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

followedNotification(BuildContext context, String name) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: kWhiteCalm,
                  ),
                ),
                Text('Anda Mem-Follow $name',
                    style: TextStyle(
                        color: kWhiteCalm,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))
              ],
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.purple[900],
              borderRadius: BorderRadius.circular(12.0)),
        );
      });
}

checkFollowersSheet(BuildContext context, dynamic snapshot) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: kLightGreen, borderRadius: BorderRadius.circular(12.0)),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(snapshot.data.data()['useruid'])
                  .collection('followers')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return new ListView(
                      children: snapshot.data.docs
                          .map((DocumentSnapshot documentSnapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return new ListTile(
                        onTap: () {
                          if (documentSnapshot.data()['useruid'] !=
                              Provider.of<AuthenticationService>(context,
                                      listen: false)
                                  .getUserUid) {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: MutualProfile(
                                      userUid:
                                          documentSnapshot.data()['useruid'],
                                    ),
                                    type: PageTransitionType.leftToRight));
                          }
                        },
                        trailing: documentSnapshot.data()['useruid'] ==
                                Provider.of<AuthenticationService>(context,
                                        listen: false)
                                    .getUserUid
                            ? Container(
                                width: 0.0,
                                height: 0.0,
                              )
                            : MaterialButton(
                                color: kDarkGreenColor,
                                child: Text('Unfollow',
                                    style: TextStyle(
                                        color: kWhiteCalm,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0)),
                                onPressed: () {},
                              ),
                        leading: CircleAvatar(
                          backgroundColor: kGreyColor,
                          backgroundImage: NetworkImage(
                            documentSnapshot.data()['userimage'],
                          ),
                        ),
                        title: Text(
                          documentSnapshot.data()['username'],
                          style: GoogleFonts.openSans(
                              color: kBlackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                        ),
                      );
                    }
                  }).toList());
                }
              }),
        );
      });
}

checkFollowingSheet(BuildContext context, dynamic snapshot) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: kLightGreen, borderRadius: BorderRadius.circular(12.0)),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(
                      Provider.of<AuthenticationService>(context, listen: false)
                          .getUserUid)
                  .collection('following')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return new ListView(
                      children: snapshot.data.docs
                          .map((DocumentSnapshot documentSnapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return new ListTile(
                        onTap: () {
                          if (documentSnapshot.data()['useruid'] !=
                              Provider.of<AuthenticationService>(context,
                                      listen: false)
                                  .getUserUid) {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: MutualProfile(
                                      userUid:
                                          documentSnapshot.data()['useruid'],
                                    ),
                                    type: PageTransitionType.leftToRight));
                          }
                        },
                        trailing: documentSnapshot.data()['useruid'] ==
                                Provider.of<AuthenticationService>(context,
                                        listen: false)
                                    .getUserUid
                            ? Container(
                                width: 0.0,
                                height: 0.0,
                              )
                            : MaterialButton(
                                color: kDarkGreenColor,
                                child: Text('-',
                                    style: TextStyle(
                                        color: kWhiteCalm,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0)),
                                onPressed: () {},
                              ),
                        leading: CircleAvatar(
                          backgroundColor: kGreyColor,
                          backgroundImage: NetworkImage(
                            documentSnapshot.data()['userimage'],
                          ),
                        ),
                        title: Text(
                          documentSnapshot.data()['username'],
                          style: GoogleFonts.openSans(
                              color: kBlackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                        ),
                      );
                    }
                  }).toList());
                }
              }),
        );
      });
}

showPostDetails(BuildContext context, DocumentSnapshot documentSnapshot) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: kGreyColor, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      child:
                          Image.network(documentSnapshot.data()['postimage']),
                    )),
                Text(documentSnapshot.data()['caption'],
                    style: TextStyle(
                        color: kWhiteCalm,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onLongPress: () {
                          Provider.of<PostFunction>(context, listen: false)
                              .showLikes(
                                  context, documentSnapshot.data()['caption']);
                        },
                        onTap: () {
                          print('Adding like...');
                          Provider.of<PostFunction>(context, listen: false)
                              .addLike(
                                  context,
                                  documentSnapshot.data()['caption'],
                                  Provider.of<AuthenticationService>(context,
                                          listen: false)
                                      .getUserUid);
                        },
                        child: Icon(
                          FontAwesomeIcons.heart,
                          color: Colors.red,
                          size: 22.0,
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('posts')
                              .doc(documentSnapshot.data()['caption'])
                              .collection('likes')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                    snapshot.data.docs.length.toString(),
                                    style: TextStyle(
                                        color: kWhiteCalm,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0)),
                              );
                            }
                          }),
                      Container(
                        width: 80.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Provider.of<PostFunction>(context,
                                        listen: false)
                                    .showComments(context, documentSnapshot,
                                        documentSnapshot.data()['caption']);
                              },
                              child: Icon(
                                FontAwesomeIcons.comment,
                                color: kDarkGreenColor,
                                size: 22.0,
                              ),
                            ),
                            StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('posts')
                                    .doc(documentSnapshot.data()['caption'])
                                    .collection('comments')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                          snapshot.data.docs.length.toString(),
                                          style: TextStyle(
                                              color: kWhiteCalm,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0)),
                                    );
                                  }
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
      });
}
