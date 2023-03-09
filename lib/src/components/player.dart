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

  final Vector2 textureSize = Vector2(113, 176);
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
    position = Vector2(game.size.x / 2, game.size.y - size.y);

    final sprites = (await _spriteImages).map(Sprite.new).toList();
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.05);

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!isColliding) {
      position.x += direction.x * speed * dt;
      position.y += direction.y * speed * dt;
      if (position.y < _maxClamp.y - _maxClamp.y / 3.5) {
        position.y = _maxClamp.y - _maxClamp.y / 3.5;
      }
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
