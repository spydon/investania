import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'high_score_provider.freezed.dart';

part 'high_score_provider.g.dart';

@Riverpod(keepAlive: true)
class HighScore extends _$HighScore {
  @override
  List<HighScoreEntry> build() {
    return const [];
  }

  void addHighScore(String name, int total) {
    state = state.toList()
      ..add(
        HighScoreEntry(
          name: name,
          totalSavings: total,
        ),
      )
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
