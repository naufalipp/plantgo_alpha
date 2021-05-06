import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';
import 'package:plantgo_alpha/screens/auth/firebase_operations.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:provider/provider.dart';

class PostFunction with ChangeNotifier {
  TextEditingController commentController = TextEditingController();
  TextEditingController updatedCaptionController = TextEditingController();
  String imageTimePosted;
  String get getImageTimePosted => imageTimePosted;

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
                            color: kDarkGreenColor,
                            child: Text('Edit Caption',
                                style: TextStyle(
                                    color: kWhiteCalm,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 300.0,
                                              height: 50.0,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    hintText: 'Add New Caption',
                                                    hintStyle: TextStyle(
                                                        color: kWhiteCalm,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16.0)),
                                                style: TextStyle(
                                                    color: kWhiteCalm,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0),
                                                controller:
                                                    updatedCaptionController,
                                              ),
                                            ),
                                            FloatingActionButton(
                                                backgroundColor: Colors.amber,
                                                child: Icon(
                                                  FontAwesomeIcons.fileUpload,
                                                  color: kDarkGreenColor,
                                                ),
                                                onPressed: () {
                                                  Provider.of<FirebaseOperations>(
                                                          context,
                                                          listen: false)
                                                      .updateCaption(postId, {
                                                    'caption':
                                                        updatedCaptionController
                                                            .text
                                                  });
                                                })
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }),
                        MaterialButton(
                            color: Colors.red,
                            child: Text('Delete Post',
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

  Future addComment(BuildContext context, String postId, String comment) async {
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(comment)
        .set({
      'comment': comment,
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
          color: Colors.white,
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
                color: kWhiteCalm,
              ),
            ),
            Container(
              width: 100.0,
              decoration: BoxDecoration(
                  border: Border.all(color: kGreyColor),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Center(
                child: Text('Comments',
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold)),
              ),
            ),
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
                    color: kWhiteCalm,
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
                            color: Colors.blue,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
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
                              onTap: () {},
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    documentSnapshot.data()['userimage']),
                              ),
                            ),
                            title: Text(
                              documentSnapshot.data()['username'],
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                            subtitle: Text(
                              documentSnapshot.data()['useremail'],
                              style: TextStyle(
                                  color: kWhiteCalm,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
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
                                            color: kWhiteCalm,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0)),
                                    onPressed: () {},
                                    color: Colors.blue,
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
              color: kGreyColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0)),
            ),
          );
        });
  }
}
