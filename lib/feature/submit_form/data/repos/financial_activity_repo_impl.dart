import 'package:aplikasi_keuangan/feature/submit_form/domain/entities/financial_activity.dart';

import '../../domain/repos/financial_activity_repo.dart';

class FinanancialActivityRepoImpl implements FinanancialActivityRepo {
  @override
  Future<void> addFinancialActivity(FinancialActivity params) {
    throw UnimplementedError();
  }

  @override
  Future<List<FinancialActivity>> getListFinancialActiviy(String refID) {
    throw UnimplementedError();
  }
}
