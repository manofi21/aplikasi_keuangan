import '../../../financial_activity/domain/entities/financial_activity_status.dart';

StatusFinancialActivity checkStatusActivity(
  bool isIncomeTextNotEmpty,
  bool isOutcomeTextNotEmpty,
) {
  if (isIncomeTextNotEmpty && !isOutcomeTextNotEmpty) {
    return StatusFinancialActivity.income;
  }

  if (!isIncomeTextNotEmpty && isOutcomeTextNotEmpty) {
    return StatusFinancialActivity.outcome;
  }

  return StatusFinancialActivity.init;
}
