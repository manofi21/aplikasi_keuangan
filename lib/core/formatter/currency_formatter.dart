import 'package:flutter/services.dart';

class FirstNotZeroCurencyFormatter extends TextInputFormatter {
  final int? maxLenght;
  final bool isIdr;
  FirstNotZeroCurencyFormatter({this.maxLenght, this.isIdr = true});

  final firstNotZeroRegex =
      RegExp(r'(^(Rp\.|\$)\s([1-9][0-9]{0,2}))([\.\,]{1}[0-9]{3})$');

  final firstNotZeroIdrRegex =
      RegExp(r'^Rp\.\s([1-9][0-9]{0,2})(\,{1}[0-9]{3})*$');
  // RegExp(r'(^Rp\.\s([1-9][0-9]{0,2}))(\,{1}[0-9]{3})$');

  final firstNotZeroUsdRegex =
      RegExp(r'(^\$\s([1-9][0-9]{0,2}))(\.{1}[0-9]{3})$');

  RegExp pointingString(int modulreResult) =>
      RegExp('(?<=.{${modulreResult == 0 ? 3 : modulreResult}}).{3}');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var newValueString = '';
    var newCurrentText = newValue.text;
    final firstChracterCurrency = isIdr ? 'Rp. ' : r'$ ';
    final pointCurrency = isIdr ? ',' : '.';

    if (newCurrentText.length - firstChracterCurrency.length > 3) {
      final newString = newCurrentText.replaceAll(r'\D', '');
      final splitFirst = newString.length % 3;
      final regexAccrdingDatalength = pointingString(splitFirst);
      final returnStringAsItString = newString.replaceAllMapped(
        regexAccrdingDatalength,
        (m) => '$pointCurrency${m.group(0) ?? ''}',
      );
      newCurrentText = returnStringAsItString;
    }

    if (!newCurrentText.startsWith(RegExp(r'^(Rp\.|\$)\s'))) {
      newCurrentText = firstChracterCurrency + newCurrentText;
    }

    final isNewValueValid = isIdr
        ? firstNotZeroIdrRegex.hasMatch(newCurrentText)
        : firstNotZeroUsdRegex.hasMatch(newCurrentText);

    if (newCurrentText.isEmpty ||
        (newCurrentText.isNotEmpty && isNewValueValid)) {
      newValueString = newCurrentText;
    }

    if (newValue.text.isNotEmpty && !isNewValueValid) {
      newValueString = oldValue.text;
    }

    return TextEditingValue(
      text: newValueString,
      selection: TextSelection.collapsed(offset: newValueString.length),
    );
  }
}
