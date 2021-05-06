import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:flutter/scheduler.dart';
import 'package:plantgo_alpha/constans/fadeanimation.dart';

import 'package:plantgo_alpha/constans/constans.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/home/home_screen.dart';
import 'package:plantgo_alpha/screens/auth/landing_utils.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';
import 'package:plantgo_alpha/screens/auth/firebase_operations.dart';
import 'package:plantgo_alpha/screens/auth/signup_page.dart';

class LandingService with ChangeNotifier {
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  showUserAvatar(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: kWhiteColor,
                  ),
                ),
                CircleAvatar(
                    radius: 80.0,
                    backgroundColor: kTransarant,
                    backgroundImage: FileImage(
                        Provider.of<LandingUtils>(context, listen: false)
                            .userAvatar)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                          child: Text('Reselect',
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: kWhiteColor)),
                          onPressed: () {
                            Provider.of<LandingUtils>(context, listen: false)
                                .pickUserAvatar(context, ImageSource.gallery);
                          }),
                      MaterialButton(
                          color: Colors.blue,
                          child: Text('Confirm Image',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                              )),
                          onPressed: () {
                            Provider.of<FirebaseOperations>(context,
                                    listen: false)
                                .uploadUserAvatar(context)
                                .whenComplete(() {
                              signInSheet(context);
                            });
                          })
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: kDarkGreenColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }

  Widget passswordLessSignIn(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return new ListView(
                children:
                    snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
              return ListTile(
                trailing: Container(
                  width: 120.0,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.check, color: Colors.blue),
                        onPressed: () {
                          Provider.of<AuthenticationService>(context,
                                  listen: false)
                              .logIntoAccount(
                                  documentSnapshot.data()['useremail'],
                                  documentSnapshot.data()['userpassword'])
                              .whenComplete(() {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: HomeScreen(),
                                    type: PageTransitionType.leftToRight));
                          });
                        },
                      ),
                      IconButton(
                        icon:
                            Icon(FontAwesomeIcons.trashAlt, color: Colors.red),
                        onPressed: () {
                          Provider.of<FirebaseOperations>(context,
                                  listen: false)
                              .deleteUserData(
                                  documentSnapshot.data()['useruid'], 'users');
                        },
                      ),
                    ],
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: kDarkGreenColor,
                  backgroundImage:
                      NetworkImage(documentSnapshot.data()['userimage']),
                ),
                subtitle: Text(documentSnapshot.data()['useremail'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kWhiteColor,
                        fontSize: 12.0)),
                title: Text(documentSnapshot.data()['username'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green)),
              );
            }).toList());
          }
        },
      ),
    );
  }

  logInSheet(BuildContext context) {
    return showModalBottomSheet(
      //BELOM KEALAR NI SHEET
      backgroundColor: kMainColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      isScrollControlled: true,
      context: context,
      builder: (context) => AnimatedPadding(
        duration: Duration(milliseconds: 150),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150.0),
                child: Divider(
                  thickness: 4.0,
                  color: kWhiteColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: userEmailController,
                  decoration: InputDecoration(
                    hintText: 'Enter Email...',
                    hintStyle: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: userPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Enter Password...',
                    hintStyle: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: FloatingActionButton(
                      backgroundColor: Colors.blue,
                      child: Icon(FontAwesomeIcons.check, color: kWhiteColor),
                      onPressed: () {
                        if (userEmailController.text.isNotEmpty) {
                          Provider.of<AuthenticationService>(context,
                                  listen: false)
                              .logIntoAccount(userEmailController.text,
                                  userPasswordController.text)
                              .whenComplete(() {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: HomeScreen(),
                                    type: PageTransitionType.bottomToTop));
                          });
                        } else {
                          warningText(context, 'Fill all the data!');
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }

  //signup
  signInSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: kMainColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.965,
              decoration: new BoxDecoration(
                color: kMainColor,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(16.0),
                  topRight: const Radius.circular(16.0),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120.0),
                      child: Divider(
                        thickness: 4.0,
                        color: kWhiteColor,
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: FileImage(
                          Provider.of<LandingUtils>(context, listen: false)
                              .getUserAvatar),
                      backgroundColor: Colors.red,
                      radius: 60.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                            2,
                            Text(
                              'Nama',
                              style: kLabelStyle,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          FadeAnimation(
                            2,
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Color(0xFF95CF29),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              height: 60.0,
                              child: TextField(
                                controller: userNameController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Masukan Nama..',
                                  hintStyle: kHintTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                            2,
                            Text(
                              'Email',
                              style: kLabelStyle,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          FadeAnimation(
                            2,
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Color(0xFF95CF29),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              height: 60.0,
                              child: TextField(
                                controller: userEmailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Masukan Email',
                                  hintStyle: kHintTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                            2,
                            Text(
                              'Password',
                              style: kLabelStyle,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          FadeAnimation(
                            2,
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Color(0xFF95CF29),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              height: 60.0,
                              child: TextField(
                                controller: userPasswordController,
                                obscureText: _isObscure,
                                //validator
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Enter your Password',
                                  hintStyle: kHintTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () => {
                            //auth sign up to firebase
                            if (userEmailController.text.isNotEmpty)
                              {
                                Provider.of<AuthenticationService>(context,
                                        listen: false)
                                    .createAccount(userEmailController.text,
                                        userPasswordController.text)
                                    .whenComplete(() {
                                  print('Creating collection...');
                                  Provider.of<FirebaseOperations>(context,
                                          listen: false)
                                      .createUserCollection(context, {
                                    'userpassword': userPasswordController.text,
                                    'useruid':
                                        Provider.of<AuthenticationService>(
                                                context,
                                                listen: false)
                                            .getUserUid,
                                    'useremail': userEmailController.text,
                                    'username': userNameController.text,
                                    'userimage': Provider.of<LandingUtils>(
                                            context,
                                            listen: false)
                                        .getUserAvatarUrl,
                                  });
                                }).whenComplete(() {
                                  Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          child: HomeScreen(),
                                          type:
                                              PageTransitionType.bottomToTop));
                                })
                              }
                            else
                              {warningText(context, 'Fill all the data!')}
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            primary: kWhiteCalm,
                            padding: EdgeInsets.all(15.0),
                          ),
                          child: Text(
                            'SIGN UP',
                            style: GoogleFonts.openSans(
                              color: Color(0xFF527DAA),
                              letterSpacing: 1.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
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
