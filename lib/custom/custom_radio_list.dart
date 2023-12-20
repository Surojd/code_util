import 'package:code_util/custom/custom_radio.dart';
import 'package:flutter/material.dart';

class CustomRadioList<T> extends StatelessWidget {
  final Map<T, String> options;

  final T? groupValue;

  final void Function(T? t)? onChanged;

  final String labelText;

  final String? Function(T? value)? validator;

  final Axis scrollDirection;

  const CustomRadioList(
    this.labelText, {
    super.key,
    required this.options,
    required this.onChanged,
    this.groupValue,
    this.validator,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: groupValue,
      onSaved: onChanged,
      validator: validator,
      builder: (field) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              labelText,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: options.entries.map((item) {
                return CustomRadio<T>(
                  mainAxisSize: scrollDirection == Axis.vertical ? MainAxisSize.max : MainAxisSize.min,
                  value: item.key,
                  groupValue: groupValue,
                  title: item.value,
                  onTap: () => field.didChange(item.key),
                );
              }).toList(),
            ),
            const SizedBox(height: 6),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  field.errorText!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
