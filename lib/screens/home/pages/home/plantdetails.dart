import 'package:flutter/material.dart';
import 'package:plantgo_alpha/constans/color_constans.dart';
import 'package:plantgo_alpha/models/class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantgo_alpha/models/widgets.dart';
import 'package:plantgo_alpha/screens/home/pages/forum/video.dart';
import 'package:video_player/video_player.dart';

class PlantDetails extends StatelessWidget {
  final Tanaman tanaman;
  PlantDetails({this.tanaman});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                      placeholder:
                          AssetImage('assets/images/loading-green.gif'),
                    ),
                  ),
                ),
                bottom: new TabBar(
                  indicatorColor: Colors.purple,
                  labelColor: Colors.black,
                  tabs: <Tab>[
                    new Tab(text: '${tanaman.title}'),
                    new Tab(text: "Hama & Penyakit"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Container(
                color: kWhiteColor,
                padding: EdgeInsets.only(top: 8.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      Text('Alat dan Bahan',
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      ToolsWidget(
                        tools: tanaman.tools,
                      ),
                      Divider(
                        thickness: 1,
                        color: kDarkGreenColor,
                      ),
                      Text('Langkah-langkah',
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      TanamanSteps(
                        steps: tanaman.steps,
                      ),
                      Divider(
                        thickness: 1,
                        color: kDarkGreenColor,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: kWhiteColor,
                padding: EdgeInsets.only(top: 8.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text('Hama dan penyakit pada',
                            style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                      Text('${tanaman.title}',
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      //VideoViewer()
                      HamaWidget(
                        hama: tanaman.hama,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoViewer extends StatefulWidget {
  @override
  final Tanaman tanaman;
  VideoViewer({this.tanaman});

  _VideoViewerState createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {
  VideoPlayerController _controller;

  Tanaman tanaman;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=74tHX6PzkMU')
      ..initialize().then((_) {
        setState(() {
          // do stuff
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class TanamanSteps extends StatelessWidget {
  final List<Steps> steps;
  TanamanSteps({this.steps});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: steps.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return StepsTag(
            steps: steps[index],
          );
        },
      ),
    );
  }
}

class ToolsWidget extends StatelessWidget {
  final List<Tools> tools;
  ToolsWidget({this.tools});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: ListView.builder(
        itemCount: tools.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ToolsTag(
            tools: tools[index],
          );
        },
      ),
    );
  }
}

class HamaWidget extends StatelessWidget {
  final List<Hama> hama;
  HamaWidget({this.hama});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: hama.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return HamaTag(
            hama: hama[index],
          );
        },
      ),
    );
  }
}
