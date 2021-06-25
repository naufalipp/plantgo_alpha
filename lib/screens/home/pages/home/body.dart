import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantgo_alpha/screens/home/pages/home/about.dart';
import 'package:plantgo_alpha/screens/home/pages/home/legal.dart';
import 'package:plantgo_alpha/screens/home/pages/home/weather_info.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl/intl.dart';

import 'package:plantgo_alpha/screens/auth/landing_page.dart';
import 'package:plantgo_alpha/screens/auth/authentication_service.dart';
import 'package:plantgo_alpha/constans/fadeanimation.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/models/data.dart';
import 'package:plantgo_alpha/screens/home/pages/home/plantdetails.dart';
import 'package:plantgo_alpha/screens/home/pages/home/weather_widget.dart';

//import 'package:simple_location_picker/simple_location_picker_screen.dart';
//import 'package:simple_location_picker/simple_location_result.dart';
import 'package:plantgo_alpha/models/weather/weather_provider.dart';
import 'package:plantgo_alpha/models/weather/daily_weather.dart';
import 'package:plantgo_alpha/models/weather/location_error.dart';
import 'package:plantgo_alpha/models/weather/weather_utils.dart';
import 'package:plantgo_alpha/models/weather.dart';

class Body extends StatefulWidget {
  static const routeName = '/homeScreen';

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  PageController _pageController = PageController();
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Future<void> _getData() async {
    _isLoading = true;
    final weatherData = Provider.of<WeatherProvider>(context, listen: false);
    weatherData.getWeatherData();
    _isLoading = false;
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<WeatherProvider>(context, listen: false).getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context);
    final myContext = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: kDarkGreenColor,
      appBar: AppBar(
        title: Text(
          "PlantGo ",
          style: GoogleFonts.allerta(
              fontSize: 18, fontWeight: FontWeight.bold, color: kWhiteColor),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            color: kWhiteColor,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: kDarkGreenColor,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: Container(
            color: kLightGreen,
            child: Column(
              // Changed this to a Column from a ListView
              children: <Widget>[
                _createHeader(),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: About(),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        EvaIcons.infoOutline,
                        color: kBlackColor,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "About ",
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: kBlackColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: Legal(),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        EvaIcons.fileTextOutline,
                        color: kBlackColor,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Term & Use",
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: kBlackColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                // Add this to force the bottom items to the lowest point
                Text(
                  "PlantGo v0.1",
                  style: GoogleFonts.openSans(
                      fontSize: 9,
                      color: kBlackColor,
                      fontWeight: FontWeight.w400),
                ),
                Divider(
                  thickness: 1,
                ),
                Column(
                  children: <Widget>[
                    _createFooterItem(
                        icon: EvaIcons.logOutOutline,
                        text: 'Logout',
                        onTap: () {
                          logOutDialog(context);
                        }),
                  ],
                ),
              ],
            )),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: kMainColor,
              ),
            )
          : weatherData.loading
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: kMainColor,
                  ),
                )
              : weatherData.isLocationError
                  ? LocationError()
                  : SafeArea(
                      child: ListView(
                        physics: AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        children: <Widget>[
                          FadeAnimation(
                            2,
                            Container(
                              margin:
                                  EdgeInsets.only(bottom: kDefaultPadding * 1),

                              // It will cover 20% of our total height
                              height: 185,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: kDefaultPadding,
                                      right: kDefaultPadding,
                                      bottom: 36 + kDefaultPadding,
                                    ),
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: kDarkGreenColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(36),
                                        bottomRight: Radius.circular(36),
                                      ),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Mari Berkebun dirumah',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      top: 60,
                                      child: RefreshIndicator(
                                        onRefresh: () => _refreshData(context),
                                        backgroundColor: kMainColor,
                                        child: Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: kDefaultPadding),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: kDefaultPadding),
                                            height: 125,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(0, 10),
                                                  blurRadius: 50,
                                                  color: kDarkGreenColor
                                                      .withOpacity(0.23),
                                                ),
                                              ],
                                            ),
                                            child: ListView(children: [
                                              WeatherWidget(
                                                wData: weatherData,
                                              ),
                                              WeatherInfo(
                                                  wData: weatherData
                                                      .currentWeather),
                                            ])),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          FadeAnimation(
                            2,
                            Container(
                              height: 20,
                              margin: EdgeInsets.only(
                                  left: 20, right: 14, bottom: 5),
                              child: Text(
                                '• Pilih berbagai tanaman yang anda ingin coba tanam',
                                style: GoogleFonts.openSans(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: kDarkGreenColor),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            2,
                            Container(
                              color: kLightGreen,
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: Data.tanaman.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2, left: 16, right: 16, bottom: 8),
                                      child: InkWell(
                                        splashColor: kDarkGreenColor,
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PlantDetails(
                                                        tanaman:
                                                            Data.tanaman[index],
                                                      )));
                                        },
                                        child: Card(
                                            color:
                                                Color(Data.tanaman[index].color),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0)),
                                            child: Container(
                                              height: 120,
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: <Widget>[
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              left: 10),
                                                          height: 50,
                                                          width: 60,
                                                          child: Image(
                                                            image: AssetImage(Data
                                                                .tanaman[index]
                                                                .icon),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              left: 10),
                                                          child: Text(
                                                              Data.tanaman[index]
                                                                  .title,
                                                              style: GoogleFonts
                                                                  .allerta(
                                                                fontSize: 17,
                                                                color:
                                                                    Colors.black,
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: ShaderMask(
                                                      shaderCallback: (rect) {
                                                        return LinearGradient(
                                                          begin: Alignment
                                                              .centerRight,
                                                          end: Alignment
                                                              .centerLeft,
                                                          colors: [
                                                            Colors.black,
                                                            Colors.transparent
                                                          ],
                                                        ).createShader(
                                                            Rect.fromLTRB(
                                                                0,
                                                                0,
                                                                rect.width,
                                                                rect.height));
                                                      },
                                                      blendMode: BlendMode.dstIn,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                        child: Hero(
                                                          tag: Data
                                                              .tanaman[index].id,
                                                          child: FadeInImage(
                                                            image: AssetImage(Data
                                                                .tanaman[index]
                                                                .image),
                                                            fit: BoxFit.cover,
                                                            placeholder: AssetImage(
                                                                'assets/images/loading-green.gif'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: kLightGreen,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/backgroundLogin2.png'))),
      child: Stack(children: <Widget>[
        Positioned(
            top: 18,
            bottom: 10.0,
            left: 16.0,
            child: Text("PlantGo",
                style: GoogleFonts.openSans(
                    color: kLightGreen,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold))),
      ]));
}

Widget _createFooterItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}

logOutDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kDarkGreenColor,
          title: Text('Log Out?',
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold)),
          actions: [
            MaterialButton(
                child: Text('No',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        decoration: TextDecoration.underline,
                        decorationColor: kWhiteColor)),
                onPressed: () {
                  Navigator.pop(context);
                }),
            MaterialButton(
                color: Colors.red,
                child: Text('Yes',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    )),
                onPressed: () {
                  Provider.of<AuthenticationService>(context, listen: false)
                      .logout()
                      .whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: LandingPage(),
                            type: PageTransitionType.bottomToTop));
                  });
                })
          ],
        );
      });
}
