import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
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
              style: GoogleFonts.openSans(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class HamaTag extends StatelessWidget {
  final Hama hama;

  HamaTag({this.hama});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 1, 8, 10),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kLightGreen,
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 100,
              width: 180,
              margin: EdgeInsets.only(top: 10),
              child: CachedNetworkImage(
                imageUrl: hama.imagehama,
                imageBuilder: (context, imageProvider) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(kMainColor)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                hama.namehama,
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10),
              child: Text(
                hama.desc,
                style: GoogleFonts.openSans(color: kBlackColor, fontSize: 14.0),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class StepsTag extends StatelessWidget {
  final Steps steps;
  StepsTag({this.steps});

  @override
  Widget build(BuildContext context) {
    String number = steps.no.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                //backgroundColor: Color(Data.tanaman.color),
                backgroundColor: kMainColor,
                child: Text(number,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(steps.step,
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          steps.imageSteps == ''
              ? SizedBox.shrink()
              : Container(
                  height: 150,
                  width: 250,
                  margin: EdgeInsets.only(top: 10),
                  child: CachedNetworkImage(
                    imageUrl: steps.imageSteps,
                    imageBuilder: (context, imageProvider) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(kMainColor)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Divider(
              thickness: 0.8,
              color: kMainColor,
            ),
          ),
        ],
      ),
    );
  }
}
