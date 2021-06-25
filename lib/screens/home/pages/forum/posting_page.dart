import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:plantgo_alpha/screens/home/home_screen.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/forum.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/forum_service.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/upload_post.dart';
import 'package:plantgo_alpha/screens/auth/firebase_operations.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantgo_alpha/constans/fadeanimation.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/constans/constans.dart';
import 'package:page_transition/page_transition.dart';

class PostingPage extends StatefulWidget {
  @override
  _PostingPageState createState() => _PostingPageState();
}

class _PostingPageState extends State<PostingPage> {
  Function _onTapItem;
  TextEditingController captionController = TextEditingController();
  TextEditingController titlecaptionController = TextEditingController();
  String uploadPostImageUrl, uploadVideoUrl;
  String get getUploadPostImageUrl => uploadPostImageUrl;
  String get getUploadVideoUrl => uploadVideoUrl;
  File uploadPostImage, uploadPostVideo;
  File get getUploadPostImage => uploadPostImage;
  File get getUploadPostVideo => uploadPostVideo;
  UploadTask imagePostUploadTask, videoUploadTask;

  Widget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: kMainColor.withOpacity(0.6),
      centerTitle: true,
      title: RichText(
        text: TextSpan(
          text: ' Form Diskusi',
          style: TextStyle(
            color: kWhiteCalm,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: Divider(
        thickness: 2.0,
        color: kMainColor,
      ),
    );
  }

  Widget _buildImagePost() {
    return Container(
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                IconButton(
                    icon: Icon(Icons.image_aspect_ratio, color: Colors.amber),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.fullscreen_exit, color: Colors.yellow),
                    onPressed: () {})
              ],
            ),
          ),
          Container(
            height: 200.0,
            width: 300.0,
            child: Image.file(
                Provider.of<UploadPost>(context, listen: false).uploadPostImage,
                fit: BoxFit.contain),
          )
        ],
      ),
    );
  }

  Widget _buildTitleQuestion() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: 30.0,
              width: 30.0,
              child: Icon(Icons.text_fields_rounded)),
          Container(
            height: 70.0,
            width: 3.0,
            color: kMainColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              height: 100.0,
              width: 250.0,
              child: TextField(
                maxLines: 2,
                textCapitalization: TextCapitalization.words,
                inputFormatters: [LengthLimitingTextInputFormatter(100)],
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLength: 100,
                controller: titlecaptionController,
                style: GoogleFonts.openSans(
                    color: kBlackColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: 'Beri Judul...',
                  hintStyle: GoogleFonts.openSans(
                    color: kGreyColor,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(10.0)),
    );
  }

  Widget _buildMainText() {
    return Container(
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: 30.0, width: 30.0, child: Icon(EvaIcons.textOutline)),
          Container(
            height: 110.0,
            width: 3.0,
            color: kMainColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              height: 160.0,
              width: 250.0,
              child: TextField(
                maxLines: 7,
                inputFormatters: [LengthLimitingTextInputFormatter(300)],
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLength: 300,
                controller: captionController,
                style: GoogleFonts.openSans(
                  color: kBlackColor,
                  fontSize: 15.0,
                ),
                decoration: InputDecoration(
                  hintText: 'Tambahkan isi Pertanyaan...',
                  hintStyle: GoogleFonts.openSans(
                    color: kGreyColor,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButton() {
    return MaterialButton(
      child: Text(
        'Bagikan',
        style: TextStyle(
            color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
      onPressed: () async {
        Provider.of<FirebaseOperations>(context, listen: false)
            .uploadPostData(titlecaptionController.text, {
          'postimage': Provider.of<UploadPost>(context, listen: false)
              .getUploadPostImageUrl,
          'title': titlecaptionController.text,
          'caption': captionController.text,
          'username': Provider.of<FirebaseOperations>(context, listen: false)
              .getInitUserName,
          'userimage': Provider.of<FirebaseOperations>(context, listen: false)
              .getInitUserImage,
          'useruid': Provider.of<AuthenticationService>(context, listen: false)
              .getUserUid,
          'time': Timestamp.now(),
          'useremail': Provider.of<FirebaseOperations>(context, listen: false)
              .getInitUserEmail,
        }).whenComplete(() async {
          // Add Data Under User Profile
          return FirebaseFirestore.instance
              .collection('users')
              .doc(Provider.of<AuthenticationService>(context, listen: false)
                  .getUserUid)
              .collection('posts')
              .add({
            'postimage': Provider.of<UploadPost>(context, listen: false)
                .getUploadPostImageUrl,
            'title': titlecaptionController.text,
            'caption': captionController.text,
            'username': Provider.of<FirebaseOperations>(context, listen: false)
                .getInitUserName,
            'userimage': Provider.of<FirebaseOperations>(context, listen: false)
                .getInitUserImage,
            'useruid':
                Provider.of<AuthenticationService>(context, listen: false)
                    .getUserUid,
            'time': Timestamp.now(),
            'useremail': Provider.of<FirebaseOperations>(context, listen: false)
                .getInitUserEmail
          });
        }).whenComplete(() {
          Navigator.of(context).pop();
        });
      },
      color: kMainColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor.withOpacity(0.6),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.camera_enhance, color: kWhiteCalm),
              onPressed: () {
                Provider.of<UploadPost>(context, listen: false)
                    .selectPostImageType(context);
              })
        ],
        title: RichText(
          text: TextSpan(
            text: 'Form Diskusi ',
            style: TextStyle(
              color: kWhiteCalm,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kLightGreen,
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildDivider(),
                      SizedBox(height: 10.0),
                      _buildImagePost(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildTitleQuestion(),
                      SizedBox(height: 5.0),
                      _buildMainText(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildButton(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  warningText(BuildContext context, String warning) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: kDarkGreenColor,
                borderRadius: BorderRadius.circular(15.0)),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(warning,
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
            ),
          );
        });
  }
}
