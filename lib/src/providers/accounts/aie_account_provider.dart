import 'package:investania/src/data/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'aie_account_provider.g.dart';

@riverpod
class AieAccount extends _$AieAccount {
  @override
  Account build() {
    return const Account(10000, 0, 0);
  }

  void add(int money) {
    state = state.copyWith(sum: state.sum + money);
  }

  void remove(int money) {
    state = state.copyWith(sum: state.sum - money);
  }

  void updateWith(int sum) {
    state = state.copyWith(sum: sum);
  }
}
