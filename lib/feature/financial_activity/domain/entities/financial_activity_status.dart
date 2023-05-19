enum StatusFinancialActivity {
  init,
  income,
  outcome
}

extension StatusFinancialActivityExt on StatusFinancialActivity {
  int get asIndex {
    switch (this) {
      case StatusFinancialActivity.income:
        return 1;
      case StatusFinancialActivity.outcome:
        return 2;
      default:
        return 0;
    }
  }
}

extension IntToStatusFinancialActivityExt on int {
  StatusFinancialActivity get fromIndex {
    switch (this) {
      case 1:
        return StatusFinancialActivity.income;
      case 2:
        return StatusFinancialActivity.outcome;
      default:
        return StatusFinancialActivity.init;
    }
  }
}

extension StatusFinancialActivityToBoolExt on StatusFinancialActivity {
  bool get isStatusFieldIncome {
    return this == StatusFinancialActivity.init || this == StatusFinancialActivity.income;
  }

  bool get isStatusFieldOutcome {
    return this == StatusFinancialActivity.init || this == StatusFinancialActivity.outcome;
  }
}
