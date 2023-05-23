import 'package:aplikasi_keuangan/core/converter/int_to_readable.dart';

RegExp pointingString(int modulreResult) =>
    RegExp('(?<=.{${modulreResult == 0 ? 3 : modulreResult}}).{3}');

String currencyIdrString(int currencyValue,
    {bool justUseintToReadable = true}) {
  final currencyValueAsString = currencyValue.toString();
  const firstCharacterCurrency = r'Rp. ';
  const pointCurrency = '.';

  if (justUseintToReadable) {
    final readableValue = intToReadable(currencyValue);
    return firstCharacterCurrency + readableValue;
  }

  final splitFirst = currencyValueAsString.length % 3;
  final regexAccrdingDatalength = pointingString(splitFirst);
  final returnStringAsItString = currencyValueAsString.replaceAllMapped(
    regexAccrdingDatalength,
    (m) => '$pointCurrency${m.group(0) ?? ''}',
  );

  return firstCharacterCurrency + returnStringAsItString;
}
