/// Convert [int] 10000 to 10.000
String intToReadable(int value) {
  final stringValue = value.toString();
  return stringValue.replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (match) => '${match[1]}.',
  );
}
