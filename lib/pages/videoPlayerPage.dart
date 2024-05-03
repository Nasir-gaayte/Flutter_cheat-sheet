import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  String url = 'https://www.youtube.com/watch?v=RPpL5wDADMQ';
  late Future<void> init;
  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(url));
    init = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: init,
          builder: (context, s) {
            if (s.connectionState == ConnectionState.done) {
              return Center(
                  child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Container(
                          height: 150, child: VideoPlayer(_controller))));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
                setState(() {});
              });
            },
            child: _controller.value.isPlaying
                ? Icon(Icons.pause)
                : Icon(Icons.play_arrow))
      ],
    );
  }
}
