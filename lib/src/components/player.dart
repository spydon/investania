import 'package:collection/collection.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/widgets.dart';

class Player extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameReference {
  Player() : super(anchor: Anchor.bottomLeft);

  final Vector2 textureSize = Vector2(113, 176);
  final Map<({String device, Axis axis}), double> _deviceVelocity = {};
  final double _movementSpeed = 200;

  void setVelocity(String device, Axis axis, double velocity) {
    _deviceVelocity[(device: device, axis: axis)] = velocity;
  }

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

    final directionX = _deviceVelocity.entries
        .where((element) => element.key.axis == Axis.horizontal)
        .map((e) => e.value)
        .sum;

    final directionY = _deviceVelocity.entries
        .where((element) => element.key.axis == Axis.vertical)
        .map((e) => e.value)
        .sum;

    position.x += directionX * _movementSpeed * dt;
    position.y += directionY * _movementSpeed * dt;
    position.y = position.y.clamp(game.size.y - game.size.y / 3.5, game.size.y);
    position.x = position.x.clamp(0, game.size.x - size.x);
  }
}
