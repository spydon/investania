import 'package:flame/game.dart';
import 'package:flutter/material.dart';

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
      child: Container(
        height: 400,
        width: 400,
        child: Column(
          children: [
            InkWell(
              child: Text('Start game'),
              onTap: () {
                router.pushReplacementNamed('game');
              },
            ),
          ],
        ),
      ),
    );
  }
}
