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
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 400,
          width: 400,
          child: Column(
            children: [
              _MenuButton(
                router: router,
                name: 'Start game',
                routeName: 'game',
              ),
              const SizedBox(
                height: 20,
              ),
              _MenuButton(
                router: router,
                name: 'Highscore',
                routeName: 'highscore',
              ),
              const SizedBox(
                height: 20,
              ),
              _MenuButton(
                router: router,
                name: 'About',
                routeName: 'about',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    super.key,
    required this.router,
    required this.name,
    required this.routeName,
  });

  final String name;
  final String routeName;
  final RouterComponent router;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        height: 50,
        width: 200,
        child: InkWell(
          child: Center(
            child: Text(
              name,
              style: const TextStyle(color: Colors.green),
            ),
          ),
          onTap: () {
            router.pushReplacementNamed(routeName);
          },
        ),
      ),
    );
  }
}
