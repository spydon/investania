import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'time_manager.g.dart';

@riverpod
class TimeManager extends _$TimeManager {
  @override
  DateTime build() {
    return DateTime(2023);
  }

  void startNewLevel() {
    state = DateTime(state.year + 1);
  }

  bool levelIsOver() {
    return state.month == 12 && state.day == 31;
  }

  void increment(double dt) {
    if (levelIsOver()) {
      return;
    }
    state = state.add(Duration(minutes: (dt * 5000).toInt()));
  }
}
