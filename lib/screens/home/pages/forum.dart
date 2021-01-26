import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/models/data.dart';

class Forum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
            // It will cover 20% of our total height
            height: 180,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                    bottom: 36 + kDefaultPadding,
                  ),
                  height: 120,
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
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: kDarkGreenColor.withOpacity(0.23),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: kDarkGreenColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              // surffix isn't working properly  with SVG
                              // thats why we use row
                              // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              child: GridView.builder(gridDelegate: null, itemBuilder: null)),
        ],
      ),
    ));
  }
}
