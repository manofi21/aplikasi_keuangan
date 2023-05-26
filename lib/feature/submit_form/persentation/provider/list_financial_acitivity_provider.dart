import 'package:aplikasi_keuangan/ui_export.dart';

import '../../../financial_activity/data/repos/financial_activity_repo_impl.dart';
import '../../../financial_activity/domain/entities/financial_activity.dart';

class ListFinancialActivityProvider extends ChangeNotifier {
  var listFinancialActivity = <FinancialActivity>[];
  var isLoading = false;

  Future<void> getActivity() async {
    final financeActivityImpl = FinanancialActivityRepoImpl();
    isLoading = true;
    notifyListeners();

    listFinancialActivity =
        await financeActivityImpl.getListFinancialActiviy("");
    isLoading = false;
    notifyListeners();
  }
}
