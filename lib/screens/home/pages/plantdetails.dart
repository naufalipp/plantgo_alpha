import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/models/class.dart';
import 'package:google_fonts/google_fonts.dart';

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
              backgroundColor: Color(tanaman.color),
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
                Text('Alat dan Bahan',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                ToolsWidget(
                  tools: tanaman.tools,
                ),
                Text('Langkah-langkah',
                    style: TextStyle(
                        color: Colors.black,
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
                backgroundColor: kMainColor,
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

class ToolsWidget extends StatelessWidget {
  final List<String> tools;
  final List<String> toolsimg;
  ToolsWidget({this.tools, this.toolsimg});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
          itemCount: tools.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 80,
                color: kMainColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        child: Container(
                          child: FadeInImage(
                            image: NetworkImage(toolsimg[index]),
                            fit: BoxFit.cover,
                            placeholder:
                                AssetImage('assets/images/loading-green.gif'),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Chip(
                        backgroundColor: kMainColor,
                        label: Text(tools[index],
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
