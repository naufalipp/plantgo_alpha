import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool loop;
  Video({this.loop, this.videoPlayerController});
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  ChewieController _chewieController;
  @override
  void initState() {
    _chewieController = ChewieController(
        looping: widget.loop,
        autoInitialize: true,
        aspectRatio: 16 / 9,
        videoPlayerController: widget.videoPlayerController);
    super.initState();
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }
}
