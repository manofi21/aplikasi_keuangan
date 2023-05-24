import 'package:sqflite/sqflite.dart';

import '../../feature/financial_activity/data/model/financial_activiy_model.dart';

Future<void> updateTables(
  Database db,
  int oldVersion,
  int newVersion,
) async {
  if (oldVersion < 2 && newVersion >= 2) {
    FinancialActivityModel.adddingColumnCategory(db: db);
  }
}