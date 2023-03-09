import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:investania/src/investania.dart';

void main() async {
  runApp(
    const GameWidget.controlled(gameFactory: Investania.new),
  );
}
