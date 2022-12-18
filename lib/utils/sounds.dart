import 'package:flame_audio/flame_audio.dart';

class Sounds{


  static void playStartBgm() async {
    await FlameAudio.bgm.stop();
    // FlameAudio.bgm.play("startbgm_01.mp3");
  }

  static void playBattleBgm()async{
    await FlameAudio.bgm.stop();
    // FlameAudio.bgm.play("bgmloop8_01.mp3");
  }

}