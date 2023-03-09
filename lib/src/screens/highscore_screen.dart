import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investania/src/investania.dart';
import 'package:investania/src/providers/aie_account_provider.dart';
import 'package:investania/src/providers/savings_account_provider.dart';

class Highscore extends ConsumerWidget {
  final Investania game;

  const Highscore({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aie = ref.watch(aieAccountProvider).sum;
    final savings = ref.watch(savingsProviderProvider).sum;

    const missedFaktura = 1337;

    final totalSavings = aie + savings; // - missedFaktura;

    return Container(
      color: Colors.blue,
      width: game.size.x,
      height: game.size.y,
      child: Stack(
        children: [
          Positioned(
            top: 70,
            left: 150,
            child: Text('Savings account: ${savings}'),
          ),
          Positioned(
            top: 70,
            right: 150,
            child: Text('AiE Account: ${aie}'),
          ),

          const Text('Missed fakturas: ${missedFaktura}'),
          //
          //
          Align(
            child: Text('Total savings: ${totalSavings}'),
          ),
          //
        ],
      ),
    );

    // animation of additon of 'savings' + 'AiE'
  }
}
