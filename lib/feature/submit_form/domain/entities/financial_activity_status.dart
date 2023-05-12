enum StatusFinancialActivity {
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
        return 1;
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
        return StatusFinancialActivity.income;
    }
  }
}