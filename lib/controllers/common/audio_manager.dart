import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  // static final player = AudioPlayer();

  static Future playAudio(String audio) async {
    final audioPlayer = AudioPlayer();
    final player = AudioCache(prefix: 'assets/');
    final url = await player.load('audio/$audio.mp3');
    audioPlayer.setUrl(url.path, isLocal: true);
    audioPlayer.play(url.path, isLocal: true);
    // await player.play(AssetSource());
  }
}