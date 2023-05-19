import 'package:flutter/material.dart';

import '../../../../core/utils/widget/text_field_widget.dart';

class FieldMemo extends StatelessWidget {
  final TextEditingController controller;
  const FieldMemo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(width: 1)
      ),
      child: TextFieldWidget(
        controller: controller,
        maxLines: 3,
        border: InputBorder.none,
      ),
    );
  }
}
