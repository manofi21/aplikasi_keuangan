enum SqfliteOrder {
  asc,
  desc,
}

extension SqfliteOrderValue on SqfliteOrder {
  String get value {
    switch (this) {
      case SqfliteOrder.asc:
        return "asc";
      case SqfliteOrder.desc:
        return "desc";
      default:
        return "";
    }
  }
}