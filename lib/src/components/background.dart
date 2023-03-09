import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

class Background extends ParallaxComponent {
  Background();

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
