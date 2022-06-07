import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioFile extends StatefulWidget {
  const AudioFile({Key? key}) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration deduration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((event) {
        setState((){
          isPlaying = event == PlayerState.PLAYING;
        });
    });

    audioPlayer.onDurationChanged.listen((duration) {
      setState((){
        deduration = duration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newDuration) {
        setState((){
          position = newDuration;
        });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Files'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://media.istockphoto.com/photos/headphones-in-trippy-colors-picture-id1309150577?b=1&k=20&m=1309150577&s=170667a&w=0&h=K7HnYslGB5TYMbSvlImWfdLxGIA_m90VEafx3BQL0X8=')),
                      shape: BoxShape.circle),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'The Flutter song',
                style: TextStyle(fontSize: 24),
              ),
              Slider(
                  min: 0,
                  max: deduration.inMinutes.toDouble(),
                  value: position.inMinutes.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);
                  }),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(position.toString()),
                    Text(deduration.toString())
                  ],
                ),
              ),
              CircleAvatar(
                radius: 40,
                child: IconButton(
                    iconSize: 48,
                    onPressed: () async {
                      if (isPlaying) {
                        audioPlayer.pause();
                      } else {
                        String url =
                            'https://www.kozco.com/tech/LRMonoPhase4.mp3';
                        audioPlayer.play(url);
                      }
                    },
                    icon: isPlaying
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
