import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final RouterComponent router;

  const About({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.green, fontSize: 18),
          child: SizedBox(
            width: 500,
            child: Column(
              children: const [
                SizedBox(height: 50),
                Text(
                  'Welcome to Investania!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Our goal is to introduce you to the world of finance. '
                  'How to invest and save money in relation to your'
                  ' income and expenses.',
                ),
                SizedBox(height: 25),
                Text(
                  'Hopefully you will learn something, but at the '
                  'very least we hope you will have a tone of fun',
                ),
                SizedBox(height: 25),
                Text(
                  'When you start the game you want to move around with'
                  ' the arrow keys to catch paychecks. You also need'
                  ' to catch the invoices because all of them will have'
                  ' a due date and need to be paid in time. If they are not'
                  ' paid, you probably know what happens ;)',
                ),
                SizedBox(height: 25),
                Text(
                  'Each month you will have the opportunity to choose how'
                  ' to invest any money you have left after paying your'
                  ' expenses. You have one year to place your money as'
                  ' wisely as you possibly can. When the year is over'
                  ' you will find out how you did.',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
