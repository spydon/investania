import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investania/src/extensions/num_extensions.dart';
import 'package:investania/src/investania.dart';
import 'package:investania/src/providers/accounts/aie_account_provider.dart';
import 'package:investania/src/providers/accounts/savings_account_provider.dart';
import 'package:investania/src/providers/date_logic/time_manager.dart';
import 'package:investania/src/providers/high_score_provider.dart';
import 'package:investania/src/providers/selected_investment_option_provider.dart';
import 'package:investania/src/widgets/button.dart';

class HighScore extends ConsumerWidget {
  final Investania game;

  const HighScore({
    required this.game,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final highScore = ref.watch(highScoreProvider);
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(),
                  },
                  defaultColumnWidth: const FlexColumnWidth(3),
                  border: TableBorder.all(width: 2.0, color: Colors.green),
                  children: [
                    const TableRow(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      children: [
                        _TableCellPadded(
                          child: Text('Rank', textScaleFactor: 1.5),
                        ),
                        _TableCellPadded(
                          child: Text('Name', textScaleFactor: 1.5),
                        ),
                        _TableCellPadded(
                          child: Text('Savings', textScaleFactor: 1.5),
                        ),
                      ],
                    ),
                    ...highScore.take(10).mapIndexed((index, e) {
                      return TableRow(
                        children: [
                          _TableCellPadded(child: Text('${index + 1}')),
                          _TableCellPadded(child: Text(e.name)),
                          _TableCellPadded(
                            child: Text(e.totalSavings.currency),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 10),
                Button(
                  name: 'Back',
                  onTap: () {
                    ref.invalidate(aieAccountProvider);
                    ref.invalidate(savingsProvider);
                    ref.invalidate(selectedInvestmentOptionProvider);
                    ref.invalidate(timeManagerProvider);
                    game.router.pushReplacementNamed('menu');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TableCellPadded extends StatelessWidget {
  final Widget child;

  const _TableCellPadded({
    required this.child,
  });

  @override
  TableCell build(BuildContext context) => TableCell(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: child,
        ),
      );
}
