import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:investania/src/widgets/button.dart';

class About extends StatelessWidget {
  final RouterComponent router;

  const About({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        color: Colors.transparent,
        child: Container(
          child: Center(
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.green, fontSize: 18),
              child: SizedBox(
                width: 500,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const Text(
                        'Welcome to Investania!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Our goal is to introduce you to the world of finance. '
                        'How to invest and save money in relation to your'
                        ' income and expenses.',
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Hopefully you will learn something, but at the '
                        'very least we hope you will have a tone of fun',
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'When you start the game you want to move around with'
                        ' the arrow keys to catch paychecks. You also need'
                        ' to catch the invoices because all of them will have'
                        ' a due date and need to be paid in time. If they are not'
                        ' paid, you probably know what happens ;)',
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Each month you will have the opportunity to choose how'
                        ' to invest any money you have left after paying your'
                        ' expenses. You have one year to place your money as'
                        ' wisely as you possibly can. When the year is over'
                        ' you will find out how you did.',
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        textAlign: TextAlign.center,
                        'We who brought you this app are:\n\n'
                        'Sofie - DJ\n'
                        'Lukas - Flame master \n'
                        'Teddy - Mr Pacman \n'
                        'Joakim - F1 Ace\n'
                        'Johannes - Provides\n'
                        'Petrus - Test much\n'
                        'John - Logging you in(?)\n'
                        'Tobias - Team German',
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Button(
                        name: 'Back',
                        onTap: () => router.pushReplacementNamed('menu'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
