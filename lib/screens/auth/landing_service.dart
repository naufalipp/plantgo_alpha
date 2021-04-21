import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: SignUpPage(),
                                      type: PageTransitionType.leftToRight));
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
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter name...',
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
                      backgroundColor: Colors.red,
                      child: Icon(FontAwesomeIcons.check, color: kWhiteColor),
                      onPressed: () {
                        //auth sign up to firebase
                        if (userEmailController.text.isNotEmpty) {
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
                              'useruid': Provider.of<AuthenticationService>(
                                      context,
                                      listen: false)
                                  .getUserUid,
                              'useremail': userEmailController.text,
                              'username': userNameController.text,
                              'userimage': Provider.of<LandingUtils>(context,
                                      listen: false)
                                  .getUserAvatarUrl,
                            });
                          }).whenComplete(() {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: HomeScreen(),
                                    type: PageTransitionType.bottomToTop));
                          });
                        } else {
                          warningText(context, 'Fill all the data!');
                        }
                      }),
                )
              ],
            ),
          );
        });
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
