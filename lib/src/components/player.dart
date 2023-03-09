import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

class Player extends SpriteAnimationGroupComponent<PlayerState>
    with CollisionCallbacks, HasGameReference {
  Player() : super(anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    final textureSize = Vector2(16, 18);
    size = textureSize * 4;
    current = PlayerState.flying;
    position = Vector2(game.size.x / 2, game.size.y - size.y);

    animations = {
      PlayerState.flying: await SpriteAnimation.load(
        'placeholder.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: textureSize,
        ),
      ),
    };
    add(CircleHitbox());
  }
}

enum PlayerState {
  flying,
}
