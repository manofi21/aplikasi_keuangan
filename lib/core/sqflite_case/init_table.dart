import 'package:sqflite/sqflite.dart';

import '../../feature/financial_activity/data/model/financial_activiy_model.dart';

Future<void> initTables({
  required Database db,
  required int version,
}) async {
  if (version == 1) {
    await db.transaction(
      (txn) async {
        FinancialActivityModel.initTable(txn);
      },
    );
  }
}
