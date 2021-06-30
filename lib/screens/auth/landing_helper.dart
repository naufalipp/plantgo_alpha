import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:provider/provider.dart';
import 'package:plantgo_alpha/constans/constans.dart';
import 'package:plantgo_alpha/constans/fadeanimation.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/home/home_screen.dart';
import 'package:plantgo_alpha/screens/auth/landing_utils.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';

class LandingHelper with ChangeNotifier {
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  bool _isObscure = true;

  Widget bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/icons/plantoGo_logodoang.png'))),
    );
  }

  Widget taglineText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: 210.0,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                padding: EdgeInsets.only(
                  bottom: 1, // Space between underline and text
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: kLightGreen,
                  width: 1.0, // Underline thickness
                ))),
                child: Text(
                  'Selamat Datang ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 0.8,
                      color: kLightGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Silahkan Login ',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  letterSpacing: 0.5,
                  color: kLightGreen,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0),
            ),
          ]),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget buildEmailTF(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          FadeAnimation(
            2,
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: kTransarant,
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
                    EvaIcons.emailOutline,
                    color: kWhiteCalm,
                  ),
                  hintText: 'Enter your Email',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget passwordTF(BuildContext context) {
    return Center(
        child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          FadeAnimation(
            2,
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: kTransarant,
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
                obscureText: _isObscure,
                controller: userPasswordController,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    EvaIcons.lockOutline,
                    color: kWhiteCalm,
                  ),
                  hintText: 'Enter your Password',
                  hintStyle: kHintTextStyle,
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildLoginBtn(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Container(
              width: 200,
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: ElevatedButton(
                onPressed: () => {
                  if (userEmailController.text.isNotEmpty)
                    {
                      Provider.of<AuthenticationService>(context, listen: false)
                          .logIntoAccount(userEmailController.text,
                              userPasswordController.text)
                          .whenComplete(() {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: HomeScreen(),
                                type: PageTransitionType.bottomToTop));
                      })
                    }
                  else
                    {warningText(context, 'Form Harap Diisi !')}
                },
                style: ElevatedButton.styleFrom(
                  primary: kWhiteCalm,
                  onPrimary: kDarkGreenColor,
                  onSurface: kGreyColor,
                  elevation: 5.0,
                  padding: EdgeInsets.all(5.0),
                ),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Color(0xFF527DAA),
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 10,
          ),
        ]);
  }

  Widget mainButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Belum Memiliki Akun?  ',
                style: TextStyle(
                  color: kLightGreen,
                  fontSize: 16.0,
                  fontFamily: 'Poppins',
                ),
              ),
              GestureDetector(
                //email icon
                onTap: () {
                  Provider.of<LandingUtils>(context, listen: false)
                      .selectAvatarOptionsSheet(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: 1, // Space between underline and text
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: kLightGreen,
                      width: 1.0, // Underline thickness
                    ))),
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.8,
                          color: kLightGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  warningText(BuildContext context, String warning) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.amber[900],
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
