import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:plantgo_alpha/screens/auth/authentication_service.dart';
import 'package:plantgo_alpha/screens/auth/firebase_operations.dart';
import 'package:provider/provider.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/video.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/posting_page.dart';

import 'package:page_transition/page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadPost with ChangeNotifier {
  TextEditingController captionController = TextEditingController();
  final picker = ImagePicker();
  String uploadPostImageUrl, uploadVideoUrl;
  String get getUploadPostImageUrl => uploadPostImageUrl;
  String get getUploadVideoUrl => uploadVideoUrl;
  File uploadPostImage, uploadPostVideo;
  File get getUploadPostImage => uploadPostImage;
  File get getUploadPostVideo => uploadPostVideo;
  UploadTask imagePostUploadTask, videoUploadTask;

  Future pickUploadPostImage(BuildContext context, ImageSource source) async {
    final uploadPostImageVal = await picker.getImage(source: source);
    uploadPostImageVal == null
        ? print('Select image')
        : uploadPostImage = File(uploadPostImageVal.path);
    print(uploadPostImageVal.path);

    uploadPostImage != null
        ? showPostImage(context)
        : print('Image upload error');

    notifyListeners();
  }

  Future pickVideo(BuildContext context) async {
    PickedFile pickedVideo = await picker.getVideo(source: ImageSource.gallery);
    uploadPostVideo = File(pickedVideo.path);
    print(uploadPostVideo.path);
    notifyListeners();
  }

  Future uploadPostImageToFirebase() async {
    Reference imageReference = FirebaseStorage.instance
        .ref()
        .child('posts/${uploadPostImage.path}/${TimeOfDay.now()}');
    imagePostUploadTask = imageReference.putFile(uploadPostImage);
    await imagePostUploadTask.whenComplete(() {
      print('Post image uploaded to storage');
    });
    imageReference.getDownloadURL().then((imageUrl) {
      uploadPostImageUrl = imageUrl;
      print(uploadPostImageUrl);
    });
    notifyListeners();
  }

  Future uploadVideoToFirebase() async {
    Reference videoReference = FirebaseStorage.instance
        .ref()
        .child('videos/${uploadPostVideo.path}/${Timestamp.now()}');
    videoUploadTask = videoReference.putFile(uploadPostVideo);
    videoReference.getDownloadURL().then((url) {
      uploadVideoUrl = url.toString();
      print(getUploadVideoUrl);
    });
    notifyListeners();
  }

  selectPostType(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: kDarkGreenColor,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: kWhiteCalm,
                  ),
                ),
                Text('Pilih Tipe Post'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          selectPostImageType(context);
                        },
                        icon: Icon(FontAwesomeIcons.image, color: kWhiteCalm),
                        label: Text('Photo',
                            style: TextStyle(
                                color: kWhiteCalm,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0))),
                    TextButton.icon(
                        onPressed: () {
                          //   Navigator.pop(context);
                          pickVideo(context).whenComplete(() {
                            previewVideo(context);
                          });
                        },
                        icon: Icon(FontAwesomeIcons.video, color: kWhiteCalm),
                        label: Text('Video',
                            style: TextStyle(
                                color: kWhiteCalm,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0))),
                  ],
                )
              ],
            ),
          );
        });
  }

  previewVideo(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
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
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      child: Video(
                        loop: true,
                        videoPlayerController:
                            VideoPlayerController.file(getUploadPostVideo),
                      ),
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                          child: Text('Reselect',
                              style: TextStyle(
                                  color: kWhiteCalm,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: kWhiteCalm)),
                          onPressed: () {
                            Provider.of<UploadPost>(context, listen: false)
                                .pickVideo(context);
                          }),
                      MaterialButton(
                          color: kMainColor,
                          child: Text('Upload Video',
                              style: TextStyle(
                                  color: kWhiteCalm,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () async {
                            Provider.of<UploadPost>(context, listen: false)
                                .uploadVideoToFirebase()
                                .whenComplete(() {
                              //Navigator.pop(context);
                            });
                          })
                    ],
                  ),
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0))),
          );
        });
  }

  selectPostImageType(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: kGreyColor, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: kWhiteCalm,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                        color: kDarkGreenColor,
                        child: Text('Gallery',
                            style: TextStyle(
                                color: kWhiteCalm,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0)),
                        onPressed: () {
                          pickUploadPostImage(
                              context,
                              ImageSource
                                  .gallery); //pickUploadPostImage(context, ImageSource.gallery);
                        }),
                    MaterialButton(
                        color: kDarkGreenColor,
                        child: Text('Camera',
                            style: TextStyle(
                                color: kWhiteCalm,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0)),
                        onPressed: () {
                          pickUploadPostImage(context, ImageSource.camera);
                        })
                  ],
                )
              ],
            ),
          );
        });
  }

  showPostImage(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.38,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: kDarkGreenColor,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: kWhiteCalm,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Container(
                    height: 200.0,
                    width: 400.0,
                    child: Image.file(uploadPostImage, fit: BoxFit.contain),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                          child: Text('Reselect',
                              style: TextStyle(
                                  color: kWhiteCalm,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: kWhiteCalm)),
                          onPressed: () {
                            selectPostImageType(context);
                          }),
                      MaterialButton(
                          color: kMainColor,
                          child: Text('Confirm Image',
                              style: TextStyle(
                                color: kWhiteCalm,
                                fontWeight: FontWeight.bold,
                              )),
                          onPressed: () {
                            uploadPostImageToFirebase().whenComplete(() {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: PostingPage(),
                                      type: PageTransitionType.leftToRight));
                              print('Image uploaded!');
                            });
                          })
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  editPostSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
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
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            IconButton(
                                icon: Icon(Icons.image_aspect_ratio,
                                    color: Colors.amber),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.fullscreen_exit,
                                    color: Colors.yellow),
                                onPressed: () {})
                          ],
                        ),
                      ),
                      Container(
                        height: 200.0,
                        width: 300.0,
                        child: Image.file(uploadPostImage, fit: BoxFit.contain),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: Icon(Icons.text_fields_rounded)),
                      Container(
                        height: 110.0,
                        width: 5.0,
                        color: kMainColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: 120.0,
                          width: 330.0,
                          child: TextField(
                            maxLines: 5,
                            textCapitalization: TextCapitalization.words,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100)
                            ],
                            maxLengthEnforced: true,
                            maxLength: 100,
                            controller: captionController,
                            style: TextStyle(
                                color: kWhiteCalm,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              hintText: 'Add A Caption...',
                              hintStyle: TextStyle(
                                  color: kWhiteCalm,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  child: Text(
                    'Share',
                    style: TextStyle(
                        color: kWhiteCalm,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  onPressed: () async {
                    Provider.of<FirebaseOperations>(context, listen: false)
                        .uploadPostData(captionController.text, {
                      'postimage': getUploadPostImageUrl,
                      'caption': captionController.text,
                      'username': Provider.of<FirebaseOperations>(context,
                              listen: false)
                          .getInitUserName,
                      'userimage': Provider.of<FirebaseOperations>(context,
                              listen: false)
                          .getInitUserImage,
                      'useruid': Provider.of<AuthenticationService>(context,
                              listen: false)
                          .getUserUid,
                      'time': Timestamp.now(),
                      'useremail': Provider.of<FirebaseOperations>(context,
                              listen: false)
                          .getInitUserEmail,
                    }).whenComplete(() async {
                      // Add Data Under User Profile
                      return FirebaseFirestore.instance
                          .collection('users')
                          .doc(Provider.of<AuthenticationService>(context,
                                  listen: false)
                              .getUserUid)
                          .collection('posts')
                          .add({
                        'postimage': getUploadPostImageUrl,
                        'caption': captionController.text,
                        'username': Provider.of<FirebaseOperations>(context,
                                listen: false)
                            .getInitUserName,
                        'userimage': Provider.of<FirebaseOperations>(context,
                                listen: false)
                            .getInitUserImage,
                        'useruid': Provider.of<AuthenticationService>(context,
                                listen: false)
                            .getUserUid,
                        'time': Timestamp.now(),
                        'useremail': Provider.of<FirebaseOperations>(context,
                                listen: false)
                            .getInitUserEmail
                      });
                    }).whenComplete(() {
                      Navigator.pop(context);
                    });
                  },
                  color: kMainColor,
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: kDarkGreenColor,
                borderRadius: BorderRadius.circular(12.0)),
          );
        });
  }
}
