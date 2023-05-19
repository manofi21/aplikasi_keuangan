import 'package:flutter/material.dart';

import '../../../../core/utils/widget/text_field_widget.dart';

class FieldMemo extends StatelessWidget {
  final TextEditingController controller;
  const FieldMemo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      
      controller: controller,
      maxLines: 3,
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
}
