import 'package:aplikasi_keuangan/core/utils/sql_base/sql_base_repo.dart';
import 'package:aplikasi_keuangan/feature/submit_form/domain/entities/financial_activity.dart';

import '../../domain/repos/financial_activity_repo.dart';
import '../model/financial_activiy_model.dart';

class FinanancialActivityRepoImpl implements FinanancialActivityRepo {
  @override
  Future<void> addFinancialActivity(FinancialActivity params) async {
    final repoSql = SqlBaseRepoImpl();
    final financialActivity = FinancialActivityModel(
      memo: params.memo,
      status: params.status,
      amount: params.amount,
      dateTime: params.dateTime.toString()
    );
    
    return repoSql.insertData(FinancialActivityModel.table, financialActivity.toMap());
  }

  @override
  Future<List<FinancialActivity>> getListFinancialActiviy(String refID) {
    throw UnimplementedError();
  }
}
