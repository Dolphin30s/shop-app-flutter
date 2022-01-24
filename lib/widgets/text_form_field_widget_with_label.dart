import 'package:flutter/material.dart';
import 'package:open_cart/utils/sized_box_custom.dart';
import 'package:open_cart/utils/styles.dart';

class TextFormFieldWithLabelWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const TextFormFieldWithLabelWidget({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: tsCOrangeCustomFFPrimaryS15,
        ),
        const SBH15(),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text('Enter your $label'),
          ),
        ),
        const SBH15(),
      ],
    );
  }
}
