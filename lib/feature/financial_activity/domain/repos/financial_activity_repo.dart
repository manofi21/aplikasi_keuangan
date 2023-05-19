import '../entities/financial_activity.dart';

abstract class FinanancialActivityRepo {
  Future<void> addFinancialActivity(FinancialActivity params);
  Future<List<FinancialActivity>> getListFinancialActiviy(String refID);
}
