import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:investania/src/components/player.dart';
import 'package:investania/src/data/pickup.dart';
import 'package:investania/src/providers/accounts/aie_account_provider.dart';

class Invoice extends SpriteComponent
    with HasGameReference, CollisionCallbacks, HasComponentRef, PickUp {
  final Vector2 movementSpeed;

  Invoice(this.movementSpeed, {this.color = Colors.transparent});

  late int amount;
  late DateTime dueDate;
  late Color color;

  @override
  Future<void> onLoad() async {
    final random = Random();
    sprite = await Sprite.load('invoice_placeholder.jpg');
    size = Vector2.all(componentSize);
    position = Vector2(random.nextDouble() * game.size.x - componentSize, 0);
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    move(dt);
    if (y > game.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Player) {
      removeFromParent();
      ref.read(aieAccountProvider.notifier).remove(randomAmount);
    }
  }

  @override
  void move(double dt) {
    if (y < game.size.y) {
      position += movementSpeed * dt;
    }
  }
}
