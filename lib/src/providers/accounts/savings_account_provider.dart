import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:investania/src/data/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_account_provider.g.dart';

@riverpod
class SavingsProvider extends _$SavingsProvider {
  @override
  Account build() {
    incrementAndStuff();
    return const Account(0);
  }

  Future<void> incrementAndStuff() async {
    while (true) {
      await Future<dynamic>.delayed(const Duration(seconds: 1));
      state = state.copyWith(sum: state.sum + 3);
    }
  }

  void updateWith(double sum) {
    state = state.copyWith(sum: sum);
  }
}
