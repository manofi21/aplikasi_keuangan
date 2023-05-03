import 'package:aplikasi_keuangan/core/formatter/currency_formatter.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widget/text_field_widget.dart';

class FieldFinancialCurrency extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  const FieldFinancialCurrency({super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
        labelText: labelText,
        usePrefix: true,
        prefixIcon: Icons.monetization_on_outlined,
        controller: controller,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        inputFormatters: [
          FirstNotZeroCurencyFormatter(maxLenght: 9),
        ],
    );
  }
}