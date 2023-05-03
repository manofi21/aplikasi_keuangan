import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final void Function()? onPressed;
  const SaveButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text("Save"),
      ),
    );
  }
}