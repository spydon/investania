import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Invoice extends SpriteComponent {
  Invoice({this.color = Colors.transparent});

  late int amount;
  late DateTime dueDate;
  late Color color;

  @override
  Future<void> onLoad() async {
    amount = Random().nextInt(50);
    sprite = await Sprite.load('invoice_placeholder.png');
    setColor(color);

    size = Vector2.all(50);
    add(RectangleHitbox());
  }
}
