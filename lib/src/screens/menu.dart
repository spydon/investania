import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:investania/src/widgets/button.dart';

class Menu extends StatelessWidget {
  final BuildContext context;
  final RouterComponent router;

  const Menu({
    required this.context,
    required this.router,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 400,
          width: 400,
          child: Column(
            children: [
              const Text(
                'Investania',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 50,
                  fontFamily: 'asap',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Button(
                name: 'Start game',
                onTap: () => router.pushReplacementNamed('setSavingsOptions'),
              ),
              Button(
                name: 'High score',
                onTap: () => router.pushReplacementNamed('highscore'),
              ),
              Button(
                name: 'About',
                onTap: () => router.pushReplacementNamed('about'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
