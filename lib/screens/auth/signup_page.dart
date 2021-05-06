import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:plantgo_alpha/screens/home/home_screen.dart';
import 'package:plantgo_alpha/screens/auth/landing_page.dart';
import 'package:plantgo_alpha/screens/auth/landing_service.dart';
import 'package:plantgo_alpha/screens/auth/landing_utils.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';
import 'package:plantgo_alpha/screens/auth/firebase_operations.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantgo_alpha/constans/fadeanimation.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/constans/constans.dart';
import 'package:page_transition/page_transition.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscure = true;
  bool _rememberMe = false;
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget _buildAvatar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120.0),
          child: Divider(
            thickness: 4.0,
            color: kWhiteColor,
          ),
        ),
        CircleAvatar(
          backgroundImage: FileImage(
              Provider.of<LandingUtils>(context, listen: false).getUserAvatar),
          backgroundColor: Colors.red,
          radius: 60.0,
        ),
      ],
    );
  }

  Widget _buildUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FadeAnimation(
          2,
          Text(
            'Name',
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
                hintText: 'Enter your Name..',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
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
                hintText: 'Enter your Email',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Form(
        key: _formKey,
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
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(right: 0.0),
        ),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => {
          //auth sign up to firebase
          if (userEmailController.text.isNotEmpty)
            {
              Provider.of<AuthenticationService>(context, listen: false)
                  .createAccount(
                      userEmailController.text, userPasswordController.text)
                  .whenComplete(() {
                print('Creating collection...');
                Provider.of<FirebaseOperations>(context, listen: false)
                    .createUserCollection(context, {
                  'userpassword': userPasswordController.text,
                  'useruid':
                      Provider.of<AuthenticationService>(context, listen: false)
                          .getUserUid,
                  'useremail': userEmailController.text,
                  'username': userNameController.text,
                  'userimage': Provider.of<LandingUtils>(context, listen: false)
                      .getUserAvatarUrl,
                });
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: HomeScreen(),
                        type: PageTransitionType.bottomToTop));
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
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'assets/icons/google-logo.png',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LandingPage()));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Login Here',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
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
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FadeAnimation(
                        2,
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildAvatar(),
                      SizedBox(height: 10.0),
                      _buildUsername(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                      _buildSignupBtn(),
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
