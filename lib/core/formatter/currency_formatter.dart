import 'package:flutter/services.dart';

class FirstNotZeroCurencyUSDFormatter extends TextInputFormatter {
  final int? maxLenght;
  FirstNotZeroCurencyUSDFormatter({this.maxLenght});

  RegExp pointingString(int modulreResult) =>
      RegExp('(?<=.{${modulreResult == 0 ? 3 : modulreResult}}).{3}');

  final firstNotZeroUsdRegex =
      RegExp(r'^Rp\.\s([1-9][0-9]{0,2})(\.{1}[0-9]{3})*$');
  //'^Rp\.\s([1-9][0-9]{0,2})(\,{1}[0-9]{3})*$

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var newCurrentText = newValue.text;
    const firstCharacterCurrency = r'Rp. ';
    const pointCurrency = '.';
    final maxLenght = this.maxLenght;

    if (newCurrentText.length - firstCharacterCurrency.length > 3) {
      final newString = newCurrentText.replaceAll(RegExp(r'\D+'), '');

      if (maxLenght != null && maxLenght < newString.length) {
        return TextEditingValue(
          text: oldValue.text,
          selection: TextSelection.collapsed(offset: oldValue.text.length),
        );
      }

      final splitFirst = newString.length % 3;
      final regexAccrdingDatalength = pointingString(splitFirst);
      final returnStringAsItString = newString.replaceAllMapped(
        regexAccrdingDatalength,
        (m) => '$pointCurrency${m.group(0) ?? ''}',
      );
      newCurrentText = returnStringAsItString;
    }

    if (newCurrentText.startsWith(RegExp(r'^(Rp\.)\s')) &&
        newCurrentText.length == 4) {
      return const TextEditingValue(
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    if (!newCurrentText.startsWith(RegExp(r'^(Rp\.)\s'))) {
      newCurrentText = firstCharacterCurrency + newCurrentText;
    }

    if (firstNotZeroUsdRegex.hasMatch(newCurrentText)) {
      return TextEditingValue(
        text: newCurrentText,
        selection: TextSelection.collapsed(offset: newCurrentText.length),
      );
    }

    return TextEditingValue(
      text: oldValue.text,
      selection: TextSelection.collapsed(offset: oldValue.text.length),
    );
  }
}
