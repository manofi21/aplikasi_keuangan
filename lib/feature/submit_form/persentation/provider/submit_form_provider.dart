import 'package:aplikasi_keuangan/feature/financial_activity/data/extension/string_amount_extension.dart';

import '../../../financial_activity/data/repos/financial_activity_repo_impl.dart';
import '../../../financial_activity/domain/entities/financial_activity.dart';
import '../../../financial_activity/domain/entities/financial_activity_status.dart';

class SubmitFormProvider {
  Future<void> addActivity({
    required String amount,
    required StatusFinancialActivity status,
    required String category,
    String? memo,
  }) async {
    final financeActivityImpl = FinanancialActivityRepoImpl();

    assert(
      status != StatusFinancialActivity.init,
      "One of the Text Field must be filled"
      // "Anda harus mengimput di salah satu field",
    );

    financeActivityImpl.addFinancialActivity(
      FinancialActivity(
        amount: amount.toAmountIntFromMoney,
        status: status,
        dateTime: DateTime.now(),
        memo: memo,
        category: category,
      ),
    );
  }
}
