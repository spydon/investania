import 'dart:math';

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'high_score_provider.freezed.dart';

part 'high_score_provider.g.dart';

@Riverpod(keepAlive: true)
class HighScore extends _$HighScore {
  @override
  List<HighScoreEntry> build() {
    return List.generate(20, (index) {
      const max = 1000000;
      const min = -11;

      final totalSavings = Random().nextInt(max) + min;

      return HighScoreEntry(
        name: 'Player $index',
        totalSavings: totalSavings,
      );
    })
      ..sortByCompare((e) => e.totalSavings, (e1, e2) => e2.compareTo(e1));
  }
}

@freezed
class HighScoreEntry with _$HighScoreEntry {
  const factory HighScoreEntry({
    required String name,
    required int totalSavings,
  }) = _HighScoreEntry;
}
