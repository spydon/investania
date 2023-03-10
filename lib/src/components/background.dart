import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame_audio/flame_audio.dart';

class Background extends ParallaxComponent {
  Background();

  @override
  void onMount() {
    FlameAudio.bgm
        .stop()
        .then((value) => FlameAudio.bgm.play('background_music.mp3'));
    super.onMount();
  }

  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData('parallax/back.png'),
        ParallaxImageData('parallax/sun.png'),
        ParallaxImageData('parallax/buildings.png'),
        ParallaxImageData('parallax/palms.png'),
        ParallaxImageData('parallax/palm-tree.png'),
        ParallaxImageData('parallax/highway.png'),
      ],
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );
  }
}
