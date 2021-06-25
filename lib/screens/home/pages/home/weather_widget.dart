import 'package:plantgo_alpha/models/weather/weather_utils.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class WeatherWidget extends StatelessWidget {
  final wData;

  WeatherWidget({this.wData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 80,
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //CITY
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: kDarkGreenColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Container(
                        padding: EdgeInsets.only(
                          bottom: 1, // Space between underline and text
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: kGreyColor,
                          width: 1.0, // Underline thickness
                        ))),
                        child: Text('${wData.weather.cityName}',
                            style: GoogleFonts.openSans(
                              color: Colors.green[900],
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                ),
                //Date
                Text(
                  DateFormat.yMMMEd().add_jm().format(DateTime.now()),
                  style: GoogleFonts.openSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[900],
                  ),
                ),
                //Temperature
                SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${wData.weather.temp.toStringAsFixed(0)}',
                      style: GoogleFonts.openSans(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kBlackColor,
                      ),
                    ),
                    Text(
                      "°C",
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kBlackColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 90,
            margin: EdgeInsets.fromLTRB(5, 0, 5, 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    MapString.mapStringToIcon(
                        '${wData.weather.currently}', context, 40, kMainColor),
                    SizedBox(height: 15),
                    Text(
                      toBeginningOfSentenceCase('${wData.weather.description}'),
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
