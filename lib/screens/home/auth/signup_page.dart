import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'authentication_service.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:plantgo_alpha/constans/fadeanimation.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: ListView(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          children: <Widget>[
            FadeAnimation(
              2,
              Container(
                margin: EdgeInsets.only(top: kDefaultPadding * 1),
                // It will cover 20% of our total height
                height: (MediaQuery.of(context).size.height),
                child: Stack(
                  //hapus aja
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      top: 100,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: kDefaultPadding,
                          right: kDefaultPadding,
                          bottom: 36 + kDefaultPadding,
                        ),
                        height: 100,
                        decoration: BoxDecoration(
                          color: kDarkGreenColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(36),
                            topRight: Radius.circular(36),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  FadeAnimation(
                                      1.8,
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: kGreyColor,
                                                  blurRadius: 20.0,
                                                  offset: Offset(0, 10))
                                            ]),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey[100]))),
                                              child: TextField(
                                                controller: emailController,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        "Email or Phone number",
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Colors.grey[500])),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextField(
                                                obscureText: _isObscure,
                                                controller: passwordController,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Password",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[500]),
                                                  suffixIcon: IconButton(
                                                    icon: Icon(_isObscure
                                                        ? Icons.visibility
                                                        : Icons.visibility_off),
                                                    onPressed: () {
                                                      setState(() {
                                                        _isObscure =
                                                            !_isObscure;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  FadeAnimation(
                                    2,
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 16.0),
                                      child: Material(
                                        // <----------------------------- Outer Material
                                        shadowColor: Colors.grey[50],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        elevation: 6.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            gradient: LinearGradient(
                                              begin: AlignmentDirectional
                                                  .bottomStart,
                                              end: AlignmentDirectional.topEnd,
                                              colors: [
                                                kMainColor,
                                                kDarkGreenColor,
                                              ],
                                            ),
                                          ),
                                          child: Material(
                                            // <------------------------- Inner Material
                                            type: MaterialType.transparency,
                                            elevation: 6.0,
                                            color: Colors.transparent,
                                            shadowColor: Colors.grey[50],
                                            child: InkWell(
                                              //<------------------------- InkWell
                                              splashColor: Colors.white30,
                                              onTap: () {
                                                context
                                                    .read<
                                                        AuthenticationService>()
                                                    .signIn(
                                                      email: emailController
                                                          .text
                                                          .trim(),
                                                      password:
                                                          passwordController
                                                              .text
                                                              .trim(),
                                                    );
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(16.0),
                                                child: Center(
                                                  child: Text(
                                                    "Login",
                                                    style: GoogleFonts.openSans(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 70,
                                  ),
                                  FadeAnimation(
                                    1.5,
                                    InkWell(
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                143, 148, 251, 1)),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpPage()));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FadeAnimation(
              1.8,
              Container(
                //belom mucnul
                child: Text(
                  'Selamat Datang',
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
