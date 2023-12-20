import 'package:flutter/material.dart';

class CustomCheckboxList<T> extends StatelessWidget {
  final Map<T, String> options;

  final List<T> values;

  final void Function(List<T> t) onChanged;

  final String labelText;

  final String? errorText;

  final String? Function(String? value)? validator;

  final Axis scrollDirection;

  final Color? color;

  const CustomCheckboxList(
    this.labelText, {
    super.key,
    this.errorText,
    required this.options,
    required this.onChanged,
    this.values = const [],
    this.validator,
    this.scrollDirection = Axis.vertical,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: values,
      builder: (field) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              labelText,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: color,
                  ),
            ),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: options.entries.map((item) {
                return CustomCheckbox<T>(
                  mainAxisSize: scrollDirection == Axis.vertical ? MainAxisSize.max : MainAxisSize.min,
                  value: item.key,
                  isSelected: values.contains(item.key),
                  title: item.value,
                  onTap: (bool isSelected, {T? v}) {
                    var newList = [...values];
                    isSelected ? newList.add(item.key) : newList.remove(item.key);
                    onChanged(newList);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 6),
            if ((field.errorText ?? '').isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  field.errorText!,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
              )
          ],
        );
      },
    );
  }
}

class CustomCheckbox<T> extends StatelessWidget {
  final T? value;
  final String title;
  final bool isSelected;

  final Function(bool isSelected, {T? v})? onTap;

  final MainAxisSize mainAxisSize;

  final Color? color;

  const CustomCheckbox({
    super.key,
    this.value,
    required this.title,
    this.isSelected = false,
    this.onTap,
    this.mainAxisSize = MainAxisSize.min,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: color,
          ),
    );
    return InkWell(
      onTap: () => onTap?.call(!isSelected, v: value),
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisSize: mainAxisSize,
          children: [
            Icon(
              isSelected ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            if (mainAxisSize == MainAxisSize.max)
              Expanded(
                child: text,
              )
            else
              text,
          ],
        ),
      ),
    );
  }
}
