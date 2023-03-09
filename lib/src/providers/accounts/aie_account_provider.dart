import 'package:investania/src/data/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'aie_account_provider.g.dart';

@riverpod
class AieAccount extends _$AieAccount {
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
