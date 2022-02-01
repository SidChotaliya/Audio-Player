// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MyAudio extends ChangeNotifier {
  Duration totalDuration = Duration(hours: 0, minutes: 0, seconds: 0);
  Duration currentDuration = Duration(hours: 0, minutes: 0, seconds: 0);
  String audioState = "";
  List<String> auds = [
    'https://assets.mixkit.co/music/preview/mixkit-driving-ambition-32.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-16.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3',
    'https://samplelib.com/lib/preview/mp3/sample-3s.mp3',
    'https://samplelib.com/lib/preview/mp3/sample-15s.mp3'
  ];

  MyAudio() {
    initAudio();
  }

  AudioPlayer audioplayer = AudioPlayer();
  initAudio() {
    audioplayer.onDurationChanged.listen((updatedDuration) {
      totalDuration = updatedDuration;
      notifyListeners();
    });

    audioplayer.onAudioPositionChanged.listen((updatedPosition) {
      currentDuration = updatedPosition;
      notifyListeners();
    });

    audioplayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == AudioPlayerState.STOPPED) audioState = "Stopped";

      if (playerState == AudioPlayerState.PLAYING) audioState = "Playing";

      if (playerState == AudioPlayerState.PAUSED) audioState = "Paused";
    });
  }

  int audnum = 0;
  playaudio() async {
    await audioplayer.play(auds[audnum]);
  }

  pauseaudio() async {
    await audioplayer.pause();
  }

  stopaudio() {
    audioplayer.stop();
  }

  nextaudio() {
    if (audnum == auds.length - 1) {
      audnum = 0;
      audioplayer.play(auds[audnum]);
    } else {
      audnum++;
      audioplayer.play(auds[audnum]);
    }
  }

  prevaudio() {
    if (audnum == 0) {
      audnum = auds.length - 1;
    } else {
      audnum--;
      audioplayer.play(auds[audnum]);
    }
  }

  seekAudio(Duration durationToSeek) {
    audioplayer.seek(durationToSeek);
  }
}
