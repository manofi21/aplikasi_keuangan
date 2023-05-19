import '../../../financial_activity/data/repos/financial_activity_repo_impl.dart';
import '../../../financial_activity/domain/entities/financial_activity.dart';

class ListFinancialActivityProvider {
  Future<List<FinancialActivity>> getActivity() async {
    final financeActivityImpl = FinanancialActivityRepoImpl();

    return financeActivityImpl.getListFinancialActiviy("");
  }
}