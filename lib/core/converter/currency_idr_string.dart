RegExp pointingString(int modulreResult) =>
    RegExp('(?<=.{${modulreResult == 0 ? 3 : modulreResult}}).{3}');

String currencyIdrString(int currencyValue) {
  final currencyValueAsString = currencyValue.toString();
  const firstCharacterCurrency = r'Rp. ';
  const pointCurrency = '.';

  final splitFirst = currencyValueAsString.length % 3;
  final regexAccrdingDatalength = pointingString(splitFirst);
  final returnStringAsItString = currencyValueAsString.replaceAllMapped(
    regexAccrdingDatalength,
    (m) => '$pointCurrency${m.group(0) ?? ''}',
  );

  return firstCharacterCurrency + returnStringAsItString;
}
