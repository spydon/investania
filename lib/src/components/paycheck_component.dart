import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

class PayCheckComponent extends SpriteComponent with HasGameReference {
  late int amount;

  PayCheckComponent();

  @override
  Future<void> onLoad() async {
    amount = Random().nextInt(100);
    sprite = await Sprite.load('paycheck_placeholder.jpeg');
    size = Vector2.all(100);
    position = Vector2(game.size.x / 2, 100);
    add(RectangleHitbox());
    return super.onLoad();
  }
}
