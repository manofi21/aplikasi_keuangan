import 'financial_activity_status.dart';

class FinancialActivity {
  final String? memo;
  final int amount;
  final StatusFinancialActivity status;
  final DateTime dateTime;

  FinancialActivity({
    this.memo,
    required this.amount,
    required this.status,
    required this.dateTime,
  });
}
