import 'package:investania/src/data/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_account_provider.g.dart';

@riverpod
class SavingsProvider extends _$SavingsProvider {
  @override
  Account build() {
    return const Account(0);
  }

  void add(double money) {
    state = state.copyWith(sum: state.sum + money);
  }

  void updateWith(double sum) {
    state = state.copyWith(sum: sum);
  }
}
