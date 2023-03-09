import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:investania/src/components/player.dart';
import 'package:investania/src/data/pickup.dart';
import 'package:investania/src/providers/accounts/aie_account_provider.dart';

class PayCheck extends SpriteComponent
    with HasGameReference, CollisionCallbacks, HasComponentRef, PickUp {
  late final double amount;
  final _random = Random();
  final Vector2 movementSpeed;

  PayCheck(this.movementSpeed);

  @override
  void update(double dt) {
    move(dt);
    super.update(dt);
  }

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('paycheck_placeholder.jpeg');
    size = Vector2.all(componentSize);
    position = Vector2(_random.nextDouble() * game.size.x - componentSize, 0);
    add(RectangleHitbox());

    return super.onLoad();
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Player) {
      removeFromParent();
      ref.read(aieAccountProvider.notifier).add(randomAmount);
    } else if (other is ScreenHitbox) {
      removeFromParent();
    }
  }

  @override
  void move(double dt) {
    if (y < game.size.y) {
      position += movementSpeed * dt;
    }
  }
}
