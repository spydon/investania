import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

class Player extends SpriteAnimationGroupComponent<PlayerState>
    with CollisionCallbacks, HasGameReference {
  Player() : super(anchor: Anchor.center);

  final Vector2 textureSize = Vector2(16, 18);
  Vector2 get playerSize => textureSize * 4;
  final Vector2 _minClamp = Vector2.zero();
  final Vector2 _maxClamp = Vector2.zero();
  final Vector2 direction = Vector2.zero();
  final double speed = 200;

  @override
  Future<void> onLoad() async {
    size = playerSize;
    _minClamp
      ..setFrom(size / 2)
      ..add(Vector2.all(1));
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

  @override
  void update(double dt) {
    super.update(dt);
    if (!isColliding) {
      position.x += direction.x * speed * dt;
      position.y += direction.y * speed * dt;
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is ScreenHitbox) {
      position.clamp(_minClamp, _maxClamp);
    }
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _maxClamp
      ..setFrom(size - playerSize / 2)
      ..sub(Vector2.all(1));
  }
}

enum PlayerState {
  flying,
}
