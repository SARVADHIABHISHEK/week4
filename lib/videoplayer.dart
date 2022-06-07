import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer123 extends StatefulWidget {
  const VideoPlayer123({Key? key}) : super(key: key);

  @override
  State<VideoPlayer123> createState() => _VideoPlayer123State();
}

class _VideoPlayer123State extends State<VideoPlayer123> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayBackFuture;

  @override
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _initializeVideoPlayBackFuture = _controller.initialize();
  }


  void dispose(){
      _controller.dispose();
      super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player Example'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayBackFuture,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller)),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState((){
            if(_controller.value.isPlaying){
              _controller.pause();
            }
            else{
              _controller.play();
            }
          });
        },
        child: _controller.value.isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
      ),
    );
  }
}
