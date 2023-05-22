import 'financial_activity_status.dart';

class FinancialActivity {
  final String? memo;
  final int amount;
  final StatusFinancialActivity status;
  final DateTime dateTime;
  final String category;

  FinancialActivity({
    this.memo,
    required this.amount,
    required this.status,
    required this.dateTime,
    required this.category,
  });
}
