import 'package:code_util/custom/custom_checkbox_list.dart';
import 'package:flutter/material.dart';

class ListWrapper extends StatelessWidget {
  final List<String> list;

  final double? spacing;

  final double? runSpacing;

  final double maxWidth;

  const ListWrapper({super.key, required this.list, this.spacing, this.runSpacing, this.maxWidth = 500});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing ?? 8,
      runSpacing: runSpacing ?? 8,
      alignment: WrapAlignment.start,
      direction: Axis.vertical,
      children: [
        ...list.map(
          (e) => CustomCheckbox(title: e, isSelected: true),
        ),
      ],
    );
  }
}
