import 'package:flutter_svg/svg.dart';
import 'package:plantgo_alpha/models/weather/weather_utils.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class WeatherInfo extends StatelessWidget {
  final wData;
  WeatherInfo({this.wData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      child: Column(
        children: [
          Divider(
            thickness: 1.0,
            color: kGreyColor,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              Text(
                'Presipitasi Hujan',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: kDarkGreenColor,
                ),
              ),
              Spacer(),
              SvgPicture.asset(
                'assets/icons/water.svg',
                color: kDarkGreenColor,
                height: 20,
              ),
              SizedBox(width: 5),
              Text(
                '${wData.precip}%',
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kDarkGreenColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
