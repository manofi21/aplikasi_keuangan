/// Convert dynamic data to specific
/// type in [T]. If not it will return
/// null.
T? convertType<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}