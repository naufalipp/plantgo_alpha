import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/upload_post.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/post_function.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class ForumService with ChangeNotifier {
  Widget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: kMainColor.withOpacity(0.6),
      centerTitle: true,
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
            color: kWhiteCalm,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget forumBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: kWhiteCalm, borderRadius: BorderRadius.circular(12.0)),
              child: Text(
                "Topik Terbaru",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('posts')
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SizedBox(
                          height: 500.0,
                          width: 400.0,
                          child: Lottie.asset(
                              'assets/animations/58005-loading.json')),
                    );
                  } else {
                    return loadPosts(context, snapshot);
                  }
                },
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: kGreyColor.withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                      topRight: Radius.circular(18.0))),
            ),
          ),
        ],
      ),
    );
  }

  Widget loadPosts(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    return ListView(
        children: snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
      Provider.of<PostFunction>(context, listen: false)
          .showTimeAgo(documentSnapshot.data()['time']);
      return Container(
        height: MediaQuery.of(context).size.height * 0.62,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 20.0,
                      backgroundImage: documentSnapshot.data()['userimage'] !=
                              null
                          ? NetworkImage(documentSnapshot.data()['userimage'])
                          : AssetImage('assets/images/profilepic-default.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              documentSnapshot.data()['title'],
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Container(
                              child: RichText(
                            text: TextSpan(
                                text: documentSnapshot.data()['username'],
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          ' , ${Provider.of<PostFunction>(context, listen: false).getImageTimePosted.toString()}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(0.8)))
                                ]),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.46,
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                    child: Image.network(documentSnapshot.data()['postimage'],
                        scale: 2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 80.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              Provider.of<PostFunction>(context, listen: false)
                                  .showLikes(context,
                                      documentSnapshot.data()['title']);
                            },
                            onTap: () {
                              print('Adding like...');
                              Provider.of<PostFunction>(context, listen: false)
                                  .addLike(
                                      context,
                                      documentSnapshot.data()['title'],
                                      Provider.of<AuthenticationService>(
                                              context,
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
                                  .doc(documentSnapshot.data()['title'])
                                  .collection('likes')
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
                              })
                        ],
                      ),
                    ),
                    Container(
                      width: 80.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Provider.of<PostFunction>(context, listen: false)
                                  .showComments(context, documentSnapshot,
                                      documentSnapshot.data()['title']);
                            },
                            child: Icon(
                              FontAwesomeIcons.comment,
                              color: Colors.amber,
                              size: 22.0,
                            ),
                          ),
                          StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('posts')
                                  .doc(documentSnapshot.data()['title'])
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
                                            color: kBlackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0)),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                    Spacer(),
                    Provider.of<AuthenticationService>(context, listen: false)
                                .getUserUid ==
                            documentSnapshot.data()['useruid']
                        ? IconButton(
                            icon: Icon(EvaIcons.moreVertical,
                                color: kDarkGreenColor),
                            onPressed: () {
                              Provider.of<PostFunction>(context, listen: false)
                                  .showPostOptions(context,
                                      documentSnapshot.data()['title']);
                            })
                        : Container(width: 0.0, height: 0.0)
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList());
  }
}
