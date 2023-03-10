import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

class Player extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameReference {
  Player() : super(anchor: Anchor.bottomLeft);

  final Vector2 textureSize = Vector2(113, 176);
  final Vector2 direction = Vector2.zero();
  final double speed = 200;

  @override
  Future<void> onLoad() async {
    size = textureSize;
    position = Vector2(2, game.size.y - 2);

    final images = await Future.wait(
      List.generate(43, (index) async {
        final imagePath = 'player/run_$index.png';
        return game.images.load(imagePath);
      }),
    );

    final sprites = images.map(Sprite.new).toList();
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.05);

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x += direction.x * speed * dt;
    position.y += direction.y * speed * dt;
    position.y = position.y.clamp(game.size.y - game.size.y / 3.5, game.size.y);
    position.x = position.x.clamp(0, game.size.x - size.x);
  }
}
