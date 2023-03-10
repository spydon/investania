import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:investania/src/widgets/button.dart';

class Pause extends StatelessWidget {
  final Game game;
  final RouterComponent router;

  const Pause(this.game, this.router, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        width: game.size.x,
        height: game.size.y,
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.green,
            height: 1.2,
            fontSize: 14,
          ),
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Investania -Paused-',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Button(
                        name: 'Continue',
                        onTap: () {
                          game.resumeEngine();
                          router.pop();
                        },
                      ),
                      Button(
                        name: 'Quit',
                        onTap: () {
                          // TODO(any): fix routing back to main menu
                          router.pushReplacementNamed('menu');
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
