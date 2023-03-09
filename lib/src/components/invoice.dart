import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Invoice extends SpriteComponent {
  late int amount;
  late DateTime dueDate;

  @override
  Future<void> onLoad() async {
    amount = Random().nextInt(50);
    sprite = await Sprite.load('invoice_placeholder.jpg');
    size = Vector2.all(50);
    add(RectangleHitbox());
  }
}
