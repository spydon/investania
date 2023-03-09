import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investania/src/providers/accounts/aie_account_provider.dart';
import 'package:investania/src/providers/accounts/savings_account_provider.dart';
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
    final savings = ref.watch(savingsProviderProvider);
    final account = ref.watch(aieAccountProvider);
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
                  'End of year!',
                  style: textStyle.copyWith(fontSize: 30),
                ),
                const SizedBox(height: 20),
                Text(
                  'Total: $max',
                  style: textStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Savings account',
                          style: textStyle,
                        ),
                        Text(
                          savings.sum.toInt().toString(),
                          style: textStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: savings.sum,
                      max: max,
                      onChanged: (savingsTotal) {
                        ref
                            .read(savingsProviderProvider.notifier)
                            .updateWith(savingsTotal);
                        ref
                            .read(aieAccountProvider.notifier)
                            .updateWith(max - savingsTotal);
                      },
                    ),
                    Column(
                      children: [
                        const Text(
                          'Spending account',
                          style: TextStyle(color: Colors.green),
                        ),
                        Text(
                          account.sum.toInt().toString(),
                          style: const TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      name: 'Interest account 2%',
                      onTap: () {
                        ref
                            .read(selectedInvestmentOptionProvider.notifier)
                            .set(InvestmentOption.interest);
                      },
                    ),
                    Button(
                      name: 'Fund account',
                      onTap: () {
                        ref
                            .read(selectedInvestmentOptionProvider.notifier)
                            .set(InvestmentOption.fundAccount);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      name: 'High risk stocks',
                      onTap: () {
                        ref
                            .read(selectedInvestmentOptionProvider.notifier)
                            .set(InvestmentOption.highriskStock);
                      },
                    ),
                    Button(
                      name: 'Low risk stocks',
                      onTap: () {
                        ref
                            .read(selectedInvestmentOptionProvider.notifier)
                            .set(InvestmentOption.lowriskStock);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You have selected the $investmentOption',
                      style: textStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      name: 'Next year!',
                      onTap: () {
                        router.pushReplacementNamed('game');
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
