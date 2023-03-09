import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_account_provider.freezed.dart';

part 'savings_account_provider.g.dart';

@riverpod
class SavingsProvider extends _$SavingsProvider {
  @override
  SavingsAccounts build() {
    const savingsAccounts = [
      _Account(0),
    ];

    incrementAndStuff();

    return const SavingsAccounts(savingsAccounts);
  }

  Future<void> incrementAndStuff() async {
    while (true) {
      await Future<dynamic>.delayed(const Duration(seconds: 1));
      state = SavingsAccounts([
        for (final acc in state.accounts) acc.copyWith(sum: acc.sum + 1),
      ]);
    }
  }
}

@freezed
class SavingsAccounts with _$SavingsAccounts {
  const factory SavingsAccounts(
    List<_Account> accounts,
  ) = _SavingsAccounts;

  const SavingsAccounts._();

  int get sum => accounts.map((e) => e.sum).sum;
}

@freezed
class _Account with _$_Account {
  const factory _Account(int sum) = __Account;
}
