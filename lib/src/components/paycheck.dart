import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/experimental.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:investania/src/components/player.dart';
import 'package:investania/src/data/pickup.dart';
import 'package:investania/src/providers/accounts/aie_account_provider.dart';

class PayCheck extends SpriteAnimationComponent
    with HasGameReference, CollisionCallbacks, HasComponentRef, PickUp {
  late final double amount;
  final _random = Random();
  final Vector2 movementSpeed;

  PayCheck(this.movementSpeed) : super(anchor: Anchor.center);

  @override
  void update(double dt) {
    super.update(dt);
    move(dt);
    if (y > game.size.y) {
      removeFromParent();
    }
  }

  @override
  Future<void> onLoad() async {
    final imagesList = await Future.wait(
      List.generate(30, (index) async {
        final imagePath = 'money/Gold_${index + 1}.png';
        return game.images.load(imagePath);
      }),
    );
    final images = imagesList + imagesList.reversed.toList();

    final sprites = images.map(Sprite.new).toList();
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.1);
    size = Vector2.all(componentSize / 2);
    position = Vector2(_random.nextDouble() * game.size.x - componentSize, 0);
    add(CircleHitbox());
    add(
      ScaleEffect.by(
        Vector2.all(1.5),
        EffectController(duration: 0.5, infinite: true, alternate: true),
      ),
    );

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
    }
  }

  @override
  void move(double dt) {
    if (y < game.size.y) {
      position += movementSpeed * dt;
    }
  }
}
