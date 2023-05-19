import 'package:aplikasi_keuangan/core/utils/sql_base/sql_base_repo.dart';
import 'package:aplikasi_keuangan/feature/financial_activity/domain/entities/financial_activity_status.dart';


import '../../domain/entities/financial_activity.dart';
import '../../domain/repos/financial_activity_repo.dart';
import '../model/financial_activiy_model.dart';

class FinanancialActivityRepoImpl implements FinanancialActivityRepo {
  @override
  Future<void> addFinancialActivity(FinancialActivity params) async {
    final repoSql = SqlBaseRepoImpl();
    final financialActivity = FinancialActivityModel(
        memo: params.memo,
        status: params.status.asIndex,
        amount: params.amount,
        dateTime: params.dateTime.toString());

    return repoSql.insertData(
        FinancialActivityModel.table, financialActivity.toMap());
  }

  @override
  Future<List<FinancialActivity>> getListFinancialActiviy(String refID) async {
    final repoSql = SqlBaseRepoImpl();
    final result = await repoSql.getListData(
        table: FinancialActivityModel.table,
        fromMap: FinancialActivityModel.fromMap);
    return result
        .map(
          (e) => FinancialActivity(
            amount: e.amount,
            status: e.status.fromIndex,
            dateTime: DateTime.parse(e.dateTime),
          ),
        )
        .toList();
  }
}
