import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';
import 'package:plantgo_alpha/screens/auth/firebase_operations.dart';
import 'package:plantgo_alpha/screens/home/pages/mutual_profile/mutual_profile.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:provider/provider.dart';

class PostFunction with ChangeNotifier {
  TextEditingController commentController = TextEditingController();
  TextEditingController updatedCaptionController = TextEditingController();
  String imageTimePosted;
  String get getImageTimePosted => imageTimePosted;
  bool isLoading = false;

  

  showTimeAgo(dynamic timedata) {
    Timestamp time = timedata;
    DateTime dateTime = time.toDate();
    imageTimePosted = timeago.format(dateTime);
    print(imageTimePosted);
    notifyListeners();
  }

  showPostOptions(BuildContext context, String postId) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150.0),
                    child: Divider(
                      thickness: 4.0,
                      color: kBlackColor,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                            color: kLightGreen,
                            child: Row(
                              children: [
                                Icon(EvaIcons.edit2Outline),
                                Text('Edit Deskripsi',
                                    style: TextStyle(
                                        color: kDarkGreenColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0)),
                              ],
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      contentPadding:
                                          EdgeInsets.only(top: 10.0),
                                      content: Container(
                                        width: 300.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('___'),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Divider(
                                              color: Colors.grey,
                                              height: 4.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 30.0, right: 30.0),
                                              child: TextFormField(
                                                
                                                maxLines: 5,
                                                textCapitalization:
                                                    TextCapitalization.words,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      300)
                                                ],
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                maxLength: 300,
                                                controller:
                                                    updatedCaptionController,
                                                decoration: InputDecoration(
                                                  hintText: "Tambahkan Deskrpsi baru",
                                                  hintStyle:
                                                      GoogleFonts.openSans(
                                                          color: kGreyColor,
                                                          fontSize: 16.0),
                                                  border: InputBorder.none,
                                                ),
                                                style: GoogleFonts.openSans(
                                                    color: kBlackColor,
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                isLoading == true
                                                    ? CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation(
                                                                Theme.of(
                                                                        context)
                                                                    .primaryColor),
                                                      )
                                                    : ElevatedButton(
                                                        onPressed: () {
                                                          Provider.of<FirebaseOperations>(
                                                                  context,
                                                                  listen: false)
                                                              .updateCaption(
                                                                  postId, {
                                                            'caption':
                                                                updatedCaptionController
                                                                    .text
                                                          }).whenComplete(() {
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              kDarkGreenColor,
                                                          onPrimary: kWhiteCalm,
                                                          onSurface: kGreyColor,
                                                          elevation: 5.0,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      25,
                                                                  vertical: 10),
                                                        ),
                                                        child: Text(
                                                          'Update',
                                                          style: TextStyle(
                                                            color: kWhiteCalm,
                                                            letterSpacing: 1.5,
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'OpenSans',
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }),
                        MaterialButton(
                            color: kLightGreen,
                            child: Row(
                              children: [
                                Icon(EvaIcons.trash2Outline),
                                Text('Hapus Post',
                                    style: TextStyle(
                                        color: kDarkGreenColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0)),
                              ],
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: kGreyColor,
                                      title: Text('Delete This Post?',
                                          style: TextStyle(
                                              color: kWhiteCalm,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold)),
                                      actions: [
                                        MaterialButton(
                                            child: Text('No',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor: kWhiteCalm,
                                                    color: kWhiteCalm,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0)),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                        MaterialButton(
                                            color: Colors.red,
                                            child: Text('Yes',
                                                style: TextStyle(
                                                    color: kWhiteCalm,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0)),
                                            onPressed: () {
                                              Provider.of<FirebaseOperations>(
                                                      context,
                                                      listen: false)
                                                  .deleteUserData(
                                                      postId, 'posts')
                                                  .whenComplete(() {
                                                Navigator.pop(context);
                                              });
                                            }),
                                      ],
                                    );
                                  });
                            })
                      ],
                    ),
                  )
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: kDarkGreenColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0))),
            ),
          );
        });
  }

  showCommentsOptions(BuildContext context, String commentId) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150.0),
                    child: Divider(
                      thickness: 4.0,
                      color: kBlackColor,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                            color: kDarkGreenColor,
                            child: Text('Edit komentar',
                                style: TextStyle(
                                    color: kWhiteCalm,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                            onPressed: () {}),
                        MaterialButton(
                            color: Colors.red,
                            child: Text('Hapus Komentar',
                                style: TextStyle(
                                    color: kBlackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: kGreyColor,
                                      title: Text('hapus Komentar ini?',
                                          style: TextStyle(
                                              color: kWhiteCalm,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold)),
                                      actions: [
                                        MaterialButton(
                                            child: Text('Tidak',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor: kWhiteCalm,
                                                    color: kWhiteCalm,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0)),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                        MaterialButton(
                                            color: Colors.red,
                                            child: Text('Ya',
                                                style: TextStyle(
                                                    color: kWhiteCalm,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0)),
                                            onPressed: () {
                                              Provider.of<FirebaseOperations>(
                                                      context,
                                                      listen: false)
                                                  .deleteUserComment(
                                                      commentId, 'comments')
                                                  .whenComplete(() {
                                                Navigator.pop(context);
                                              });
                                            }),
                                      ],
                                    );
                                  });
                            })
                      ],
                    ),
                  )
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: kDarkGreenColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0))),
            ),
          );
        });
  }

  Future addLike(BuildContext context, String postId, String subDocId) async {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(subDocId)
        .set({
      'likes': FieldValue.increment(1),
      'username': Provider.of<FirebaseOperations>(context, listen: false)
          .getInitUserName,
      'useruid':
          Provider.of<AuthenticationService>(context, listen: false).getUserUid,
      'userimage': Provider.of<FirebaseOperations>(context, listen: false)
          .getInitUserImage,
      'useremail': Provider.of<FirebaseOperations>(context, listen: false)
          .getInitUserEmail,
      'time': Timestamp.now()
    });
  }

  Future addComment(
      BuildContext context, String postId, String commentId) async {
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(commentId)
        .set({
      'comment': commentId,
      'username': Provider.of<FirebaseOperations>(context, listen: false)
          .getInitUserName,
      'useruid':
          Provider.of<AuthenticationService>(context, listen: false).getUserUid,
      'userimage': Provider.of<FirebaseOperations>(context, listen: false)
          .getInitUserImage,
      'useremail': Provider.of<FirebaseOperations>(context, listen: false)
          .getInitUserEmail,
      'time': Timestamp.now()
    });
  }

  showComments(BuildContext context, DocumentSnapshot snapshot, String docId) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.965,
        decoration: new BoxDecoration(
          color: kLightGreen,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(16.0),
            topRight: const Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150.0),
              child: Divider(
                thickness: 4.0,
                color: kBlackColor,
              ),
            ),
            Row(
              children: [
                SizedBox(width: 6),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: kBlackColor,
                    size: 30.0,
                  ),
                ),
                Spacer(),
                Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: kGreyColor),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Center(
                    child: Text('Comments',
                        style: TextStyle(
                            color: kDarkGreenColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Spacer(),
                SizedBox(width: 16),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              children: [Flexible(child: Container())],
            ),
            Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.515,
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('posts')
                        .doc(docId)
                        .collection('comments')
                        .orderBy('time')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return new ListView(
                            children: snapshot.data.docs
                                .map((DocumentSnapshot documentSnapshot) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Flex(direction: Axis.horizontal, children: [
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kLightGreen),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          //ALT Profile
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                if (documentSnapshot
                                                        .data()['useruid'] !=
                                                    Provider.of<AuthenticationService>(
                                                            context,
                                                            listen: false)
                                                        .getUserUid) {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      PageTransition(
                                                          child: MutualProfile(
                                                            userUid:
                                                                documentSnapshot
                                                                        .data()[
                                                                    'useruid'],
                                                          ),
                                                          type:
                                                              PageTransitionType
                                                                  .bottomToTop));
                                                }
                                              },
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    kDarkGreenColor,
                                                radius: 15.0,
                                                backgroundImage: documentSnapshot
                                                                .data()[
                                                            'userimage'] !=
                                                        null
                                                    ? NetworkImage(
                                                        documentSnapshot.data()[
                                                            'userimage'])
                                                    : AssetImage(
                                                        'assets/images/profilepic-default.jpg'),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                if (documentSnapshot
                                                        .data()['useruid'] !=
                                                    Provider.of<AuthenticationService>(
                                                            context,
                                                            listen: false)
                                                        .getUserUid) {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      PageTransition(
                                                          child: MutualProfile(
                                                            userUid:
                                                                documentSnapshot
                                                                        .data()[
                                                                    'useruid'],
                                                          ),
                                                          type:
                                                              PageTransitionType
                                                                  .bottomToTop));
                                                }
                                              },
                                              child: Container(
                                                  child: Text(
                                                      documentSnapshot
                                                          .data()['username'],
                                                      style: TextStyle(
                                                          color: kBlackColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16.0))),
                                            ),
                                          ),

                                          Expanded(child: SizedBox()),
                                          Container(
                                            child: Row(
                                              children: [
                                                //add icon upvote here
                                                Provider.of<AuthenticationService>(
                                                                context,
                                                                listen: false)
                                                            .getUserUid ==
                                                        documentSnapshot
                                                            .data()['useruid']
                                                    ? IconButton(
                                                        icon: Icon(
                                                            EvaIcons
                                                                .moreVertical,
                                                            color: kGreyColor,
                                                            size: 16),
                                                        onPressed: () {
                                                          Provider.of<PostFunction>(
                                                                  context,
                                                                  listen: false)
                                                              .showCommentsOptions(
                                                                  context,
                                                                  documentSnapshot
                                                                          .data()[
                                                                      'comment']);
                                                        })
                                                    : Container(
                                                        width: 0.0, height: 0.0)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.only(left: 8),
                                        child: Row(
                                          children: [
                                            SizedBox(width: 35),
                                            Row(children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.85,
                                                child: Text(
                                                  documentSnapshot
                                                      .data()['comment'],
                                                  style: TextStyle(
                                                      color: kBlackColor,
                                                      fontSize: 16.0),
                                                ),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                          color:
                                              kDarkGreenColor.withOpacity(0.2)),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                          );
                        }).toList());
                      }
                    },
                  )),
            ),
            Container(
                color: kWhiteColor.withOpacity(0.6),
                width: 400,
                height: 120.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 300.0,
                      height: 110.0,
                      child: TextFormField(
                        style: GoogleFonts.openSans(
                          color: kBlackColor,
                          fontSize: 14,
                        ),
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Add Comment...',
                          hintStyle: GoogleFonts.openSans(
                            color: kGreyColor,
                            fontSize: 14,
                          ),
                        ),
                        controller: commentController,
                      ),
                    ),
                    FloatingActionButton(
                        mini: true,
                        backgroundColor: kDarkGreenColor,
                        child: Icon(
                          EvaIcons.messageCircle,
                          color: kWhiteCalm,
                          size: 20,
                        ),
                        onPressed: () {
                          print('Adding Comment...');
                          addComment(context, snapshot.data()['title'],
                                  commentController.text)
                              .whenComplete(() {
                            commentController.clear();
                            notifyListeners();
                          });
                        })
                  ],
                ))
          ],
        ),
      ),
    );
  }

  showLikes(BuildContext context, String postId) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: kBlackColor,
                  ),
                ),
                Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: kWhiteCalm),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Center(
                    child: Text('Likes',
                        style: TextStyle(
                            color: kBlackColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('posts')
                        .doc(postId)
                        .collection('likes')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return new ListView(
                            children: snapshot.data.docs
                                .map((DocumentSnapshot documentSnapshot) {
                          return ListTile(
                            leading: GestureDetector(
                              onTap: () {
                                if (documentSnapshot.data()['useruid'] !=
                                    Provider.of<AuthenticationService>(context,
                                            listen: false)
                                        .getUserUid) {
                                  Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          child: MutualProfile(
                                            userUid: documentSnapshot
                                                .data()['useruid'],
                                          ),
                                          type:
                                              PageTransitionType.bottomToTop));
                                }
                              },
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    documentSnapshot.data()['userimage']),
                              ),
                            ),
                            title: Text(
                              documentSnapshot.data()['username'],
                              style:
                                  TextStyle(color: kBlackColor, fontSize: 16.0),
                            ),
                            trailing: Provider.of<AuthenticationService>(
                                            context,
                                            listen: false)
                                        .getUserUid ==
                                    documentSnapshot.data()['useruid']
                                ? Container(width: 0.0, height: 0.0)
                                : MaterialButton(
                                    child: Text('Follow',
                                        style: TextStyle(
                                            color: kBlackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0)),
                                    onPressed: () {
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
                                    color: kMainColor,
                                  ),
                          );
                        }).toList());
                      }
                    },
                  ),
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: kLightGreen,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0)),
            ),
          );
        });
  }
}
