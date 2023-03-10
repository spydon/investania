import 'package:intl/intl.dart';

final _numberFormat = NumberFormat.currency(
  customPattern: '#,##0',
  locale: 'sv_SE',
  decimalDigits: 0,
);

extension NumExtensions on num {
  String get currency => '${_numberFormat.format(toInt())}kr';
}
