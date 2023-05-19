extension StringAmount on String {
  int get toAmountIntFromMoney {
    String removeAllNonNumeric = replaceAll(RegExp("[^0-9]"), "");
    int parseStringToInt = int.tryParse(removeAllNonNumeric) ?? 0;
    return parseStringToInt;
  } 
}