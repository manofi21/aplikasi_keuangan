class AutopopulateModel<T> {
  /// If label is empty, the the value gonna be label itself
  final String? label;
  final T value;

  AutopopulateModel({this.label, required this.value});

  Map<String, dynamic> toMap() {
    return {
      'label': label ?? value,
      'value': value,
    };
  }

  String get labelValue => label ?? value.toString();

  AutopopulateModel<T> onChangeIsBoxChecked(bool isBoxChanged) {
    return AutopopulateModel<T>(
      value: value,
      label: label,
    );
  }

  AutopopulateModel<T> onUserInsertNewValue({required String userInput}) {
    return AutopopulateModel<T>(
      value: value,
      label: userInput,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AutopopulateModel<T> &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          value == other.value;

  @override
  int get hashCode => label.hashCode ^ value.hashCode;
}