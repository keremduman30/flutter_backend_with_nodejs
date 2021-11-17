import 'package:flutter/material.dart';
import 'package:tekrar/core/extension/context_extension.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const TextFormFieldWidget({Key? key, required this.controller, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: context.textThem.headline6,
      decoration: InputDecoration(
        label: Text(label, style: context.textThem.headline6?.copyWith(fontSize: context.normalValue)),
      ),
    );
  }
}
