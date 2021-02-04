import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/models/class.dart';
import 'package:plantgo_alpha/models/plantico_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantgo_alpha/models/data.dart';

class PlantDetails extends StatelessWidget {
  final Tanaman tanaman;
  PlantDetails({this.tanaman});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              title: Text(tanaman.title),
              backgroundColor: kDarkGreenColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: tanaman.id,
                  child: FadeInImage(
                    image: AssetImage(tanaman.image),
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/images/loading-green.gif'),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Text('Langkah-langkah',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                TanamanSteps(
                  steps: tanaman.steps,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TanamanSteps extends StatelessWidget {
  final List<String> steps;
  TanamanSteps({this.steps});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: steps.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                //backgroundColor: Color(Data.tanaman.color),
                child: Text('${index + 1}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(steps[index],
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
