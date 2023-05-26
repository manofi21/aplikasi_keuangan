import 'package:equatable/equatable.dart';

import 'financial_activity_status.dart';

class FinancialActivity extends Equatable {
  final String? memo;
  final int amount;
  final StatusFinancialActivity status;
  final DateTime dateTime;
  final String category;

  const FinancialActivity({
    this.memo,
    required this.amount,
    required this.status,
    required this.dateTime,
    required this.category,
  });

  @override
  List<Object?> get props => [memo, amount, status, dateTime, category];

  @override
  bool get stringify => true;
}
