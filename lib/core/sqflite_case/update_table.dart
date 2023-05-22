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

  if (oldVersion < 3 && newVersion >= 3) {
    FinancialActivityModel.adddingColumnCategory(db: db, isDropFirst: true);
  }

  if (oldVersion < 4 && newVersion >= 4) {
    FinancialActivityModel.adddingColumnCategory(db: db, isDropFirst: true);
  }
}