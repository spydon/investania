import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

class PayCheckComponent extends SpriteComponent with HasGameReference {
  late int amount;
  final _random = Random();
  final double _size = 50;
  final Vector2 _movementSpeed = Vector2(0, 100);

  PayCheckComponent();

  @override
  void update(double dt) {
    _move(dt);
    super.update(dt);
  }

  @override
  Future<void> onLoad() async {
    amount = _random.nextInt(100);
    sprite = await Sprite.load('paycheck_placeholder.jpeg');
    size = Vector2.all(_size);
    position = Vector2(_random.nextDouble() * game.size.x / 2, 0);
    add(RectangleHitbox());
    return super.onLoad();
  }

  void _move(double dt) {
    if (y < game.size.y) {
      position += _movementSpeed * dt;
    } else {
      removeFromParent();
    }
  }
}
