import 'dart:math';

abstract class PickUp {
  final double componentSize = 100;
  final randomAmount = (Random().nextDouble() * 1000).toInt();

  void move(double dt);
}
