import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/screens/auth/landing_helper.dart';
import 'package:provider/single_child_widget.dart';

class LandingPage extends StatefulWidget {
  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: GestureDetector(
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
                    child: Column(
                        // positioned nya gamasuk ke coulmn fix this
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Provider.of<LandingHelper>(context, listen: false)
                              .bodyImage(context),
                          Provider.of<LandingHelper>(context, listen: false)
                              .taglineText(context),
                          SizedBox(
                            height: 10,
                          ),
                          Provider.of<LandingHelper>(context, listen: false)
                              .buildEmailTF(context),
                          Provider.of<LandingHelper>(context, listen: false)
                              .passwordTF(context),
                          SizedBox(
                            height: 10,
                          ),
                          Provider.of<LandingHelper>(context, listen: false)
                              .buildLoginBtn(context),
                          SizedBox(
                            height: 20,
                          ),
                          Provider.of<LandingHelper>(context, listen: false)
                              .mainButton(context),
                        ]))),
          ],
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
}
