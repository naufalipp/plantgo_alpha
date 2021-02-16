import 'package:flutter/material.dart';
import 'class.dart';
import 'package:google_fonts/google_fonts.dart';

class ToolsTag extends StatelessWidget {
  final Tools tools;

  ToolsTag({this.tools});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 70,
        height: 80,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading-green.gif',
              image: tools.imageUrl,
            ),
            Text(
              tools.name,
              style: GoogleFonts.openSans(color: Colors.black, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
