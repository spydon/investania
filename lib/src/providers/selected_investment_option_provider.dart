import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_investment_option_provider.g.dart';

@riverpod
class SelectedInvestmentOption extends _$SelectedInvestmentOption {
  @override
  InvestmentOption build() => InvestmentOption.interest;

  void set(InvestmentOption option) {
    state = option;
  }
}

enum InvestmentOption {
  interest('Interest account 2%'),
  highriskStock('High risk stock account'),
  lowriskStock('Low risk stock account'),
  fundAccount('Fund account');

  const InvestmentOption(this.name);

  final String name;

  @override
  String toString() => name;
}
