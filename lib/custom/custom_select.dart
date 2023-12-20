import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class CustomSelect extends StatelessWidget {
  final void Function() onTap;

  final String? hintText;

  final String? labelText;

  final Widget? prefixIcon;

  final String? value;

  final String? errorText;

  final String? helperText;

  final TextEditingController? controller;

  final String? Function(dynamic value)? validator;

  final void Function(int index)? onDeleted;

  final TextInputAction? textInputAction;

  final List selectedValues;

  const CustomSelect({
    super.key,
    this.labelText,
    required this.onTap,
    this.hintText,
    this.prefixIcon,
    this.value,
    this.errorText,
    this.controller,
    this.helperText,
    this.validator,
    this.textInputAction,
    this.selectedValues = const [],
    this.onDeleted,
  }) : assert(selectedValues.length > 0 && onDeleted != null || (selectedValues.length == 0));

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      children: [
        TextFormField(
          textAlign: TextAlign.left,
          controller: controller,
          readOnly: true,
          onTap: onTap,
          initialValue: value,
          validator: validator,
          decoration: InputDecoration(
            errorText: errorText,
            labelText: labelText,
            hintText: hintText,
            helperText: helperText,
            prefixIcon: prefixIcon,
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20,
            ),
          ),
        ),
        if (selectedValues.isNotEmpty) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Selected $labelText',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: selectedValues
                .mapIndexed(
                  (index, e) => Chip(
                    label: Text(
                      e.toString(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    deleteIcon: const Icon(Icons.clear, size: 14),
                    onDeleted: () => onDeleted!(index),
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }
}
