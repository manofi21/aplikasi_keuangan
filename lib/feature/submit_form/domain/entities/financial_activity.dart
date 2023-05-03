import 'financial_activity_status.dart';

class FinancialActivity {
  final String? memo;
  final int amount;
  final int status;
  final StatusFinancialActivity dateTime;

  FinancialActivity({
    this.memo,
    required this.amount,
    required this.status,
    required this.dateTime,
  });
}
