import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/image_composition.dart';

class Player extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameReference {
  Player() : super(anchor: Anchor.center);

  Future<List<Image>> get _spriteImages async {
    final images = List.generate(43, (index) async {
      final imagePath = 'player/run_$index.png';
      return game.images.load(imagePath);
    });

    return Future.wait(images);
  }

  @override
  Future<void> onLoad() async {
    final textureSize = Vector2(113, 176);
    size = textureSize * 1.0;

    position = Vector2(game.size.x / 2, game.size.y - size.y);

    final sprites = (await _spriteImages).map(Sprite.new).toList();
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.05);

    add(CircleHitbox());
  }
}
