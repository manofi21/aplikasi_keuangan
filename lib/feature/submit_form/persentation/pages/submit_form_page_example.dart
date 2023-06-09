import 'package:aplikasi_keuangan/feature/submit_form/utils/function/determine_financial_activty_type.dart';
import 'package:aplikasi_keuangan/feature/submit_form/utils/widget/field_financial_currency.dart';
import 'package:aplikasi_keuangan/feature/submit_form/utils/widget/field_memo.dart';
import 'package:aplikasi_keuangan/feature/submit_form/utils/widget/save_button.dart';
import 'package:aplikasi_keuangan/ui_export.dart';

import '../../../financial_activity/domain/entities/financial_activity_status.dart';
import '../../domain/entites/autopopulate_model.dart';
import '../../utils/widget/field_autopopulate_category.dart';
import '../../utils/widget/list_financial_activity_widget.dart';
import '../provider/submit_form_provider.dart';

class SubmitFormPage extends StatefulWidget {
  const SubmitFormPage({super.key});

  @override
  State<SubmitFormPage> createState() => _SubmitFormPageState();
}

class _SubmitFormPageState extends State<SubmitFormPage> {
  final financialIncomeTextController = TextEditingController();
  final financialOutcomeTextController = TextEditingController();
  final noteTextController = TextEditingController();
  StatusFinancialActivity currentStatus = StatusFinancialActivity.init;
  String amountInput = "";
  String category = "";

  void onAfterClickSave() {
    setState(() {
      financialIncomeTextController.clear();
      financialOutcomeTextController.clear();
      noteTextController.clear();
      currentStatus = StatusFinancialActivity.init;
      amountInput = "";
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      financialIncomeTextController.addListener(() {
        setState(() {
          currentStatus = checkStatusActivity(
            financialIncomeTextController.text.isNotEmpty,
            financialOutcomeTextController.text.isNotEmpty,
          );
        });
        amountInput = financialIncomeTextController.text;
      });

      financialOutcomeTextController.addListener(() {
        setState(() {
          currentStatus = checkStatusActivity(
            financialIncomeTextController.text.isNotEmpty,
            financialOutcomeTextController.text.isNotEmpty,
          );
        });
        currentStatus = checkStatusActivity(
          financialIncomeTextController.text.isNotEmpty,
          financialOutcomeTextController.text.isNotEmpty,
        );
        amountInput = financialOutcomeTextController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final submitForm = context.read<SubmitFormProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Financial Activity"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              FieldFinancialCurrency(
                labelText: "Pemasukan/Income",
                controller: financialIncomeTextController,
                isFiedlEnabled: currentStatus.isStatusFieldIncome,
              ),
              const SizedBox(height: 10),
              FieldFinancialCurrency(
                labelText: "Pengeluaran/Outcome",
                controller: financialOutcomeTextController,
                isFiedlEnabled: currentStatus.isStatusFieldOutcome,
              ),
              const SizedBox(height: 10),
              FieldMemo(controller: noteTextController),
              const SizedBox(height: 10),
              CategoryFieldAutoComplete<String>(
                onSelected: (selectedCategory) {
                  setState(() {
                    category = selectedCategory.value;
                  });
                },
                items: [
                  AutopopulateModel<String>(value: "Belanja"),
                  AutopopulateModel<String>(value: "Makan"),
                  AutopopulateModel<String>(value: "Hobi"),
                ],
                indexOfInitialValue: 0,
              ),
              SaveButton(
                onPressed: () {
                  submitForm
                      .addActivity(
                          amount: amountInput,
                          status: currentStatus,
                          memo: noteTextController.text.isEmpty
                              ? null
                              : noteTextController.text,
                          category: category)
                      .whenComplete(
                    () {
                      onAfterClickSave();
                    },
                  );
                },
              ),
              const Expanded(
                child: ListFinancialActivityWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
