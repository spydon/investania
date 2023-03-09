import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investania/src/investania.dart';

class HighscoreEntry {
  final String name;
  final String totalSavings;

  const HighscoreEntry({
    required this.name,
    required this.totalSavings,
  });
}

class Highscore extends ConsumerWidget {
  final Investania game;
  late final List<HighscoreEntry> _highscore;

  Highscore({
    super.key,
    required this.game,
  }) {
    _loadHighscore();
  }

  void _loadHighscore() {
    _highscore = List.generate(5, (index) {
      const max = 1000000;
      const min = -11;

      final totalSavings = Random().nextInt(max) + min;

      return HighscoreEntry(
        name: 'Player $index',
        totalSavings: '$totalSavings',
      );
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Container(
        color: Colors.black,
        width: game.size.x,
        height: game.size.y,
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.green,
            height: 1.2, //SETTING THIS CAN SOLVE YOUR PROBLEM
            fontSize: 14,
          ),
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(),
              },
              defaultColumnWidth: const FlexColumnWidth(4),
              border: TableBorder.all(width: 2.0, color: Colors.green),
              children: [
                const TableRow(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  children: [
                    _TableCellPadded(child: Text('Rank', textScaleFactor: 1.5)),
                    _TableCellPadded(child: Text('Name', textScaleFactor: 1.5)),
                    _TableCellPadded(
                      child: Text('Savings', textScaleFactor: 1.5),
                    ),
                  ],
                ),
                ..._highscore.mapIndexed((index, e) {
                  return TableRow(
                    children: [
                      _TableCellPadded(child: Text('${index + 1}')),
                      _TableCellPadded(child: Text(e.name)),
                      _TableCellPadded(child: Text(e.totalSavings)),
                    ],
                  );
                }),
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