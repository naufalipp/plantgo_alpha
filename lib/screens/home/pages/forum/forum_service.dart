import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/upload_post.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/post_function.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';

import 'package:page_transition/page_transition.dart';
import 'package:plantgo_alpha/screens/home/pages/mutual_profile/mutual_profile.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class ForumService with ChangeNotifier {
  Widget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: kDarkGreenColor,
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
            icon: Icon(Icons.camera_enhance, color: kWhiteCalm),
            onPressed: () {
              Provider.of<UploadPost>(context, listen: false)
                  .selectPostType(context);
            })
      ],
      title: RichText(
        text: TextSpan(
          text: 'Komunitas ',
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget forumBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: kLightGreen,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('posts')
              .orderBy('time', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SizedBox(
                    height: 200.0,
                    width: 200.0,
                    child:
                        Lottie.asset('assets/animations/58005-loading.json')),
              );
            } else {
              return loadPosts(context, snapshot);
            }
          },
        ),
      ),
    );
  }

  Widget loadPosts(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    return Flex(direction: Axis.horizontal, children: [
      //tambahan terbaru
      Expanded(
        //height: (snapshot.data.docs).toDouble(),
        child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            shrinkWrap: true,
            //physics: NeverScrollableScrollPhysics(),
            children:
                snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
              Provider.of<PostFunction>(context, listen: false)
                  .showTimeAgo(documentSnapshot.data()['time']);
              return Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Flex(direction: Axis.horizontal, children: [
                  Flexible(
                    child: Container(
                      //height: MediaQuery.of(context).size.height,

                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start, //tambahan
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (documentSnapshot.data()['useruid'] !=
                                        Provider.of<AuthenticationService>(
                                                context,
                                                listen: false)
                                            .getUserUid) {
                                      Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                              child: MutualProfile(
                                                userUid: documentSnapshot
                                                    .data()['useruid'],
                                              ),
                                              type: PageTransitionType
                                                  .bottomToTop));
                                    }
                                  },
                                  child: Container(
                                      child: documentSnapshot
                                                  .data()['userimage'] !=
                                              null
                                          ? CachedNetworkImage(
                                              imageUrl: documentSnapshot
                                                  .data()['userimage'],
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                width: 40.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: kGreyColor
                                                      .withOpacity(0.4),
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            )
                                          : Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: kGreyColor
                                                      .withOpacity(0.4),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/profilepic-default.jpg'),
                                                      fit: BoxFit.cover)),
                                            )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            documentSnapshot.data()['username'],
                                            style: GoogleFonts.openSans(
                                                color: Colors.black87,
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            ' • ${Provider.of<PostFunction>(context, listen: false).getImageTimePosted.toString()}',
                                            style: GoogleFonts.openSans(
                                                color: kBlackColor
                                                    .withOpacity(0.8),
                                                fontSize: 11.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: Text(
                                documentSnapshot.data()['title'],
                                style: GoogleFonts.openSans(
                                    color: kBlackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 2.0, left: 8.0, right: 8.0),
                            child: Flex(direction: Axis.horizontal, children: [
                              Flexible(
                                //height: MediaQuery.of(context).size.height * 0.15,
                                //width: MediaQuery.of(context).size.width,
                                // color: kGreyColor,
                                child: Text(
                                  documentSnapshot.data()['caption'],
                                  style: GoogleFonts.openSans(
                                      color: kBlackColor, fontSize: 16.0),
                                ),
                              ),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 4),
                            child: Container(
                              child: smallImage(context, documentSnapshot),
                              height: 60,
                              width: 120,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
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
                                            Provider.of<PostFunction>(context,
                                                    listen: false)
                                                .showLikes(
                                                    context,
                                                    documentSnapshot
                                                        .data()['title']);
                                          },
                                          onTap: () {
                                            print('Adding like...');
                                            Provider.of<PostFunction>(context,
                                                    listen: false)
                                                .addLike(
                                                    context,
                                                    documentSnapshot
                                                        .data()['title'],
                                                    Provider.of<AuthenticationService>(
                                                            context,
                                                            listen: false)
                                                        .getUserUid);
                                          },
                                          child: Icon(
                                            FontAwesomeIcons.arrowAltCircleUp,
                                            color: kGreyColor,
                                            size: 18.0,
                                          ),
                                        ),
                                        StreamBuilder<QuerySnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection('posts')
                                                .doc(documentSnapshot
                                                    .data()['title'])
                                                .collection('likes')
                                                .snapshots(),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              } else {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: RichText(
                                                    text: TextSpan(
                                                        text: snapshot
                                                            .data.docs.length
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .openSans(
                                                                color:
                                                                    kGreyColor,
                                                                fontSize: 16.0),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: ' votes',
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                color:
                                                                    kGreyColor,
                                                                fontSize: 16.0,
                                                              )),
                                                        ]),
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
                                            Provider.of<PostFunction>(context,
                                                    listen: false)
                                                .showComments(
                                                    context,
                                                    documentSnapshot,
                                                    documentSnapshot
                                                        .data()['title']);
                                          },
                                          child: Icon(
                                            FontAwesomeIcons.solidComments,
                                            color: kGreyColor,
                                            size: 16.0,
                                          ),
                                        ),
                                        StreamBuilder<QuerySnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection('posts')
                                                .doc(documentSnapshot
                                                    .data()['title'])
                                                .collection('comments')
                                                .snapshots(),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              } else {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: GestureDetector(
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
                                                    child: Text(
                                                      snapshot.data.docs.length
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.openSans(
                                                              color: kGreyColor,
                                                              fontSize: 16.0),
                                                    ),
                                                  ),
                                                );
                                              }
                                            }),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Provider.of<AuthenticationService>(context,
                                                  listen: false)
                                              .getUserUid ==
                                          documentSnapshot.data()['useruid']
                                      ? IconButton(
                                          icon: Icon(EvaIcons.moreVertical,
                                              color: kGreyColor, size: 16),
                                          onPressed: () {
                                            Provider.of<PostFunction>(context,
                                                    listen: false)
                                                .showPostOptions(
                                                    context,
                                                    documentSnapshot
                                                        .data()['title']);
                                          })
                                      : Container(width: 0.0, height: 0.0)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              );
            }).toList()),
      ),
    ]);
  }

  Widget smallImage(BuildContext context, DocumentSnapshot documentSnapshot) =>
      FullScreenWidget(
        backgroundColor: kBlackColor,
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
