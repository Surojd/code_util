import 'package:flutter/material.dart';

class CustomRadioList extends StatelessWidget {
  final Map<String, String> options;

  final String? groupValue;

  final void Function(String?)? onChanged;

  final String labelText;

  final String? errorText;

  final String? Function(String? value)? validator;

  final Axis scrollDirection;

  final Color? color;

  const CustomRadioList(
    this.labelText, {
    super.key,
    this.errorText,
    required this.options,
    this.groupValue,
    this.onChanged,
    this.validator,
    this.scrollDirection = Axis.vertical,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: validator,
      initialValue: groupValue,
      onSaved: onChanged,
      builder: (field) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              children: options.entries
                  .map(
                    (item) => CustomRadio(
                      mainAxisSize: scrollDirection == Axis.vertical ? MainAxisSize.max : MainAxisSize.min,
                      value: item.key,
                      groupValue: groupValue,
                      title: item.value,
                      onTap: () {
                        field.didChange(item.key);
                        field.save();
                      },
                    ),
                  )
                  .toList(),
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

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final String title;
  final T? groupValue;

  final Function() onTap;

  final MainAxisSize mainAxisSize;

  const CustomRadio({
    super.key,
    required this.value,
    required this.title,
    this.groupValue,
    required this.onTap,
    this.mainAxisSize = MainAxisSize.min,
  });

  @override
  Widget build(BuildContext context) {
    final text = Text(title, maxLines: 2, overflow: TextOverflow.ellipsis);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: mainAxisSize,
          children: [
            Icon(
              value == groupValue ? Icons.radio_button_checked : Icons.radio_button_off,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            if (mainAxisSize == MainAxisSize.max)
              Expanded(
                child: text,
              )
            else
              text
          ],
        ),
      ),
    );
  }
}
