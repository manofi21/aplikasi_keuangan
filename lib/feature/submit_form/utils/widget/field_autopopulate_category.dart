import 'package:flutter/material.dart';

import '../../../../core/utils/widget/text_field_widget.dart';
import '../../domain/entites/autopopulate_model.dart';

class CategoryFieldAutoComplete<T> extends StatefulWidget {
  final List<AutopopulateModel<T>> items;

  /// Prefer use index for inital value for get value in list [items]
  final int? indexOfInitialValue;
  final void Function(AutopopulateModel<T> values) onSelected;

  final void Function(TextEditingController controller)? initTextController;

  const CategoryFieldAutoComplete({
    super.key,
    this.items = const [],
    this.indexOfInitialValue,
    required this.onSelected,
    this.initTextController,
  });

  @override
  State<CategoryFieldAutoComplete<T>> createState() =>
      _CategoryFieldAutoCompleteState<T>();
}

class _CategoryFieldAutoCompleteState<T>
    extends State<CategoryFieldAutoComplete<T>> {
  List<AutopopulateModel<T>> items = [];
  String initialLable = '';
  @override
  void initState() {
    super.initState();
    items.addAll(List.from(widget.items));
    final currIndex = widget.indexOfInitialValue;
    initialLable = currIndex != null ? items[currIndex].labelValue : '';
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<AutopopulateModel<T>>(
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        if (widget.initTextController != null){
          widget.initTextController!(textEditingController);
        }
        return TextFieldWidget(
          labelText: "Category",
          usePrefix: true,
          prefixIcon: Icons.category,
          focusNode: focusNode,
          onSubmitted: (text) => onFieldSubmitted(),
          controller: textEditingController,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        );
      },
      initialValue: TextEditingValue(text: initialLable),
      onSelected: widget.onSelected,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return Iterable<AutopopulateModel<T>>.empty();
        }

        final result = items.where(
          (e) => e.labelValue.toLowerCase().contains(
                textEditingValue.text.toLowerCase(),
              ),
        );

        return result;
      },
      displayStringForOption: (option) {
        return option.labelValue;
      },
    );

  }
}
