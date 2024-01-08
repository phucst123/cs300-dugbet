import 'package:intl/intl.dart';

String convertToCurrency(int value) {
  // convert from int to string using NumberFormat
  // example 1000 -> 1.000, 1000000 -> 1.000.000
  return '${NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0)
      .format(value)} ';
}