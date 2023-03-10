import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_investment_option_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedInvestmentOption extends _$SelectedInvestmentOption {
  @override
  InvestmentOption build() => InvestmentOption.interest;

  void set(InvestmentOption option) {
    state = option;
  }
}

final _rng = Random();

enum InvestmentOption {
  interest('Interest account 2%'),
  highriskStock('High risk stock account'),
  lowriskStock('Low risk stock account'),
  fundAccount('Fund account');

  const InvestmentOption(this.name);

  final String name;

  double getPercentageRoi() {
    switch (this) {
      case InvestmentOption.interest:
        // Always 2%.
        return 0.02;
      case InvestmentOption.highriskStock:
        // Between -20% and 20%.
        return _rng.nextDouble() * 20 * (_rng.nextBool() ? 1 : -1) / 100;
      case InvestmentOption.lowriskStock:
        // Between -10% and 10%.
        return _rng.nextDouble() * 10 * (_rng.nextBool() ? 1 : -1) / 100;
      case InvestmentOption.fundAccount:
        // Between -5% and 5%.
        return _rng.nextDouble() * 5 * (_rng.nextBool() ? 1 : -1) / 100;
    }
  }

  @override
  String toString() => name;
}
