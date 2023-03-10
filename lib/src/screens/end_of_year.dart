import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investania/src/extensions/num_extensions.dart';
import 'package:investania/src/providers/accounts/aie_account_provider.dart';
import 'package:investania/src/providers/accounts/savings_account_provider.dart';
import 'package:investania/src/providers/date_logic/time_manager.dart';
import 'package:investania/src/providers/selected_investment_option_provider.dart';
import 'package:investania/src/widgets/button.dart';

class EndOfYear extends ConsumerWidget {
  final BuildContext context;
  final RouterComponent router;

  const EndOfYear({
    required this.context,
    required this.router,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savings = ref.watch(savingsProvider);
    final account = ref.watch(aieAccountProvider);
    final accountNotifier = ref.watch(aieAccountProvider.notifier);
    final isGameOver =
        ref.watch(timeManagerProvider).year == 2026 || account.sum < 0;
    final investmentOption = ref.watch(selectedInvestmentOptionProvider);
    final max = savings.sum + account.sum;
    const textStyle = TextStyle(color: Colors.green);
    return MaterialApp(
      home: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: 800,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'End of ${isGameOver ? 'game' : 'year'} summary',
                  style: textStyle.copyWith(fontSize: 30),
                ),
                const SizedBox(height: 20),
                Text(
                  'Total: ${max.currency}',
                  style: textStyle,
                ),
                Text(
                  'Savings account: ${savings.sum.currency}',
                  style: textStyle,
                ),
                Text(
                  'Missed invoices: ${accountNotifier.deductables}',
                  style: textStyle,
                ),
                Text(
                  'Spending account: ${account.sum.currency}',
                  style: textStyle,
                ),
                Text(
                  'Investment strategy: $investmentOption',
                  style: textStyle,
                ),
                Text(
                  'Return on investment: '
                  '${savings.roi} (${savings.roiPercentage * 100}%)',
                  style: textStyle,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isGameOver)
                      Button(
                        name: 'See highscore',
                        onTap: () {
                          router.pushReplacementNamed('highscore');
                        },
                      )
                    else
                      Button(
                        name: 'Next year!',
                        onTap: () {
                          accountNotifier.setDeductable(0);
                          router.pushReplacementNamed('setSavingsOptions');
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
