import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    required this.name,
    this.onTap,
    super.key,
  });

  final String name;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.greenAccent),
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          height: 50,
          width: 200,
          child: InkWell(
            onTap: onTap ?? () {},
            child: Center(
              child: Text(
                name,
                style: const TextStyle(color: Colors.green),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
