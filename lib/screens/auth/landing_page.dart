import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/auth/landing_helper.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';
import 'package:plantgo_alpha/screens/home/home_screen.dart';
import 'package:plantgo_alpha/constans/fadeanimation.dart';
import 'package:plantgo_alpha/constans/constans.dart';
import 'package:plantgo_alpha/models/auth_result_status.dart';
import 'package:plantgo_alpha/models/auth_exceptions_handler.dart';

import 'package:page_transition/page_transition.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:provider/single_child_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isObscure = true;
  bool isInProgress = false;
  bool _isSubmitting;

  String _email;
  String _password;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: ModalProgressHUD(
        inAsyncCall: isInProgress,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF9BC736),
                      kMainColor,
                      kMainColor,
                      kDarkGreenColor,
                    ],
                    stops: [0.1, 0.4, 0.6, 0.9],
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Form(
                        key: _formKey,
                        child: Column(
                            // positioned nya gamasuk ke coulmn fix this
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 30),
                              Provider.of<LandingHelper>(context, listen: false)
                                  .bodyImage(context),
                              Provider.of<LandingHelper>(context, listen: false)
                                  .taglineText(context),
                              SizedBox(
                                height: 10,
                              ),
                              buildEmailTF(),
                              passwordTF(),
                              SizedBox(
                                height: 10,
                              ),
                              buildLoginBtn(),
                              SizedBox(
                                height: 20,
                              ),
                              Provider.of<LandingHelper>(context, listen: false)
                                  .mainButton(context),
                            ]),
                      ))),
            ],
          ),
        ),
      ),
    );
  }

  bodyColor() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 0.9],
              colors: [kMainColor, kDarkGreenColor])),
    );
  }

  Widget buildEmailTF() {
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
                  border: Border.all(
                    color: kLightGreen,
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 60.0,
                child: TextFormField(
                  controller: emailController,
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
                  validator: (val) =>
                      !val.contains("@") ? "Invalid Email" : null,
                  onSaved: (val) => _email = val,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget passwordTF() {
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
                border: Border.all(
                  color: kLightGreen,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              height: 60.0,
              child: TextFormField(
                obscureText: _isObscure,
                controller: passwordController,
                validator: (val) =>
                    val.length < 6 ? "Password Is Too Short" : null,
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
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                ),
                onSaved: (val) => _password = val,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildLoginBtn() {
    return Padding(
      padding: EdgeInsets.only(top: 7),
      child: Column(
        children: [
          _isSubmitting == true
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                )
              : ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    primary: kLightGreen,
                    onPrimary: kDarkGreenColor,
                    onSurface: kGreyColor,
                    elevation: 5.0,
                    padding:
                        EdgeInsets.symmetric(horizontal: 155, vertical: 10),
                  ),
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                      color: kDarkGreenColor,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  _login() {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      //print("Email $_email, Password $_password");
      _LoginUser();
    } else {
      print("Form is Invalid");
    }
  }

  _LoginUser() async {
    setState(() {
      _isSubmitting = true;
    });

    final logMessage =
        await Provider.of<AuthenticationService>(context, listen: false)
            .logIntoAccount(emailController.text, passwordController.text);

    logMessage == "Signed In"
        ? _showSuccessSnack(logMessage)
        : _showErrorSnack(logMessage);

    //print("I am logMessage $logMessage");

    if (logMessage == "Signed In") {
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: HomeScreen(), type: PageTransitionType.bottomToTop));
    } else {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  _showSuccessSnack(String message) async {
    final snackbar = SnackBar(
      backgroundColor: Colors.purple[900],
      content: Text(
        "$message",
        style: GoogleFonts.lato(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    _formKey.currentState.reset();
  }

  _showErrorSnack(String message) {
    final snackbar = SnackBar(
      backgroundColor: Colors.purple[900],
      content: Text(
        "$message",
        style: GoogleFonts.lato(color: Colors.red),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    setState(() {
      _isSubmitting = false;
    });
  }
}
