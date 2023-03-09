import 'package:investania/src/data/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'aie_account_provider.g.dart';

@riverpod
class AieAccount extends _$AieAccount {
  @override
  Account build() {
    return const Account(10000);
  }

  void add(double money) {
    state = state.copyWith(sum: state.sum + money);
  }

  void remove(double money) {
    state = state.copyWith(sum: state.sum - money);
  }

  void updateWith(double sum) {
    state = state.copyWith(sum: sum);
  }
}
