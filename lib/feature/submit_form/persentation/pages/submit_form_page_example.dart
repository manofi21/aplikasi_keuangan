import 'package:aplikasi_keuangan/feature/submit_form/persentation/widget/field_financial_currency.dart';
import 'package:aplikasi_keuangan/feature/submit_form/persentation/widget/field_memo.dart';
import 'package:aplikasi_keuangan/feature/submit_form/persentation/widget/save_button.dart';
import 'package:flutter/material.dart';

class SubmitFormPage extends StatefulWidget {
  const SubmitFormPage({super.key});

  @override
  State<SubmitFormPage> createState() => _SubmitFormPageState();
}

class _SubmitFormPageState extends State<SubmitFormPage> {
  final financialIncomeTextController = TextEditingController();
  final financialOutcomeTextController = TextEditingController();
  final noteTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              ),
              const SizedBox(height: 10),
              FieldFinancialCurrency(
                labelText: "Pengeluaran/Outcome",
                controller: financialOutcomeTextController,
              ),
              const SizedBox(height: 10),
              FieldMemo(controller: noteTextController),
              SaveButton(
                onPressed: () {
                  
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
