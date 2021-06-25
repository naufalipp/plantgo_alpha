import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
import 'package:flushbar/flushbar.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscure = true;
  bool _rememberMe = false;
  String _username;
  String _email;
  String _password;

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _keyin = GlobalKey();

  void _flush(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
    Flushbar(
      title: "Sign-Up Berhasil!",
      message: "Anda berhasil masuk ke halaman utama",
      duration: Duration(seconds: 3),
    )..show(context);
  }

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
            'Username',
            style: kLabelStyle,
          ),
        ),
        SizedBox(height: 10.0),
        FadeAnimation(
          2,
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(
                color: kLightGreen,
                width: 1.5,
              ),
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
            child: TextFormField(
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
                hintText: 'Masukan Username..',
                hintStyle: kHintTextStyle,
              ),
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'This field is required';
                }
                if (value.trim().length < 4) {
                  return 'Username harus lebih dari 4 karakter';
                }
                // Return null if the entered username is valid
                return null;
              },
              onSaved: (val) => _username = val,
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
              border: Border.all(
                color: kLightGreen,
                width: 1.5,
              ),
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
            child: TextFormField(
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
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Please enter your email address';
                }
                // Check if the entered email has the right format
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                // Return null if the entered email is valid
                return null;
              },
              onSaved: (val) => _email = val,
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
                  border: Border.all(
                    color: kLightGreen,
                    width: 1.5,
                  ),
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
                child: TextFormField(
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
                    hintText: 'Masukan Password..',
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
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    if (value.trim().length < 8) {
                      return 'Password must be at least 8 characters in length';
                    }
                    // Return null if the entered password is valid
                    return null;
                  },
                  onSaved: (val) => _password = val,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _login(),
        style: ElevatedButton.styleFrom(
          primary: kLightGreen,
          onPrimary: kDarkGreenColor,
          onSurface: kGreyColor,
          elevation: 5.0,
          padding: EdgeInsets.symmetric(horizontal: 155, vertical: 10),
        ),
        child: Text(
          'SIGN UP',
          style: GoogleFonts.openSans(
            color: kDarkGreenColor,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _login() {
    final _form = _formKey.currentState;
    if (userEmailController.text.isNotEmpty) {
      Provider.of<AuthenticationService>(context, listen: false)
          .createAccount(userEmailController.text, userPasswordController.text)
          .whenComplete(() {
        print('Creating collection...');
        Provider.of<FirebaseOperations>(context, listen: false)
            .createUserCollection(context, {
          'userpassword': userPasswordController.text,
          'useruid': Provider.of<AuthenticationService>(context, listen: false)
              .getUserUid,
          'useremail': userEmailController.text,
          'username': userNameController.text,
          'userimage': Provider.of<LandingUtils>(context, listen: false)
              .getUserAvatarUrl,
        });
      }).whenComplete(() {
        print('signup berhasil');
        _flush(context);
      });
    } else {
      print("Form is Invalid");
    }
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
              text: 'Sudah mempunyai Akun? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Login Disini',
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

  //Google sign In 
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
          Center(
            child: Text(
              'Atau masuk menggunakan Google',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  letterSpacing: 0.8,
                  color: kLightGreen,
                  fontSize: 16.0),
            ),
          ),
          GestureDetector(
            //Google icon
            onTap: () {
              print('Signing with google');
              Provider.of<AuthenticationService>(context, listen: false)
                  .signInWithGoogle()
                  .whenComplete(() {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: HomeScreen(),
                        type: PageTransitionType.leftToRight));
              });
            },
            child: Container(
              child: Icon(FontAwesomeIcons.google, color: Colors.red),
              width: 80.0,
              height: 40.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyin,
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
                  child: Form(
                    key: _formKey,
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
                        _buildLoginBtn(),
                        _buildSignInWithText(),
                        _buildSocialBtnRow(),
                        _buildSignupBtn(),
                      ],
                    ),
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
