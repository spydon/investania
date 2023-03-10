import 'package:investania/src/data/account.dart';
import 'package:investania/src/providers/selected_investment_option_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_account_provider.g.dart';

@riverpod
class Savings extends _$Savings {
  @override
  Account build() {
    return const Account(0, 0, 0);
  }

  void add(int money) {
    state = state.copyWith(sum: state.sum + money);
  }

  void updateWith(int sum) {
    state = state.copyWith(sum: sum);
  }

  void updateReturn(InvestmentOption investmentOption) {
    final roiPercentage = investmentOption.getPercentageRoi();
    final roi = (state.sum * roiPercentage).round();
    state = state.copyWith(
      sum: state.sum + roi,
      roi: roi,
      roiPercentage: roiPercentage,
    );
  }
}
