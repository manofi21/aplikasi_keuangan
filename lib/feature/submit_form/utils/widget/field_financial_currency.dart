import 'package:aplikasi_keuangan/core/formatter/currency_formatter.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widget/text_field_widget.dart';

class FieldFinancialCurrency extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isFiedlEnabled;
  const FieldFinancialCurrency({
    super.key,
    required this.controller,
    required this.labelText,
    required this.isFiedlEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      enabled: isFiedlEnabled,
      labelText: labelText,
      usePrefix: true,
      prefixIcon: Icons.monetization_on_outlined,
      controller: controller,
      textInputType: TextInputType.number,
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      inputFormatters: [
        FirstNotZeroCurencyUSDFormatter(maxLenght: 9),
      ],
    );
  }
}
