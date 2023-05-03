import 'package:sqflite/sqflite.dart';

class FinancialActivityModel {
  final int? id;
  final String? memo;
  final int amount;
  final int status;
  final String dateTime;

  FinancialActivityModel({
    this.id,
    this.memo,
    required this.amount,
    required this.status,
    required this.dateTime,
  });

  static const table = "financial_activity";
  static const keyId = "id";
  static const keyMemo = "memo";
  static const keyAmount = "amount";
  static const keyStatus = "status";
  static const keyDateTime = "date_time";

  Map<String, dynamic> toMap() {
    return {
      keyId: id,
      keyMemo: memo,
      keyAmount: amount,
      keyStatus: status,
      keyDateTime: dateTime,
    };
  }

  static Future<void> initTable(Transaction txn) async {
    return txn.execute('''
        create table $table 
        (
          $keyId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          $keyMemo text,
          $keyAmount integer not null,
          $keyStatus integer not null,
          $keyDateTime text not null
        )
      ''');
  }

  static FinancialActivityModel fromMap(Map<String, dynamic> map) {
    return FinancialActivityModel(
      id: map[keyId],
      memo: map[keyMemo],
      amount: map[keyAmount],
      status: map[keyStatus],
      dateTime: map[keyDateTime],
    );
  }
}