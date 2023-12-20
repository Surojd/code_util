import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String title;

  final String? initialValue;
  final String? hintText;

  final void Function(String?) onChanged;

  final TextInputAction? textInputAction;

  final String? Function(String?)? validator;

  final bool singleLine;

  final TextEditingController? controller;

  final String? prefix;

  final String? errorText;

  final int? maxLength;

  final int? minLines;
  final int? maxLines;

  const CustomInputField({
    super.key,
    required this.title,
    required this.onChanged,
    this.initialValue,
    this.textInputAction,
    this.validator,
    this.singleLine = false,
    this.hintText,
    this.controller,
    this.prefix = 'Enter',
    this.errorText,
    this.maxLength,
    this.minLines,
    this.maxLines,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.initialValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller ?? _textEditingController,
          minLines: widget.minLines ?? (widget.singleLine ? 1 : 10),
          maxLines: widget.maxLines ?? (widget.singleLine ? 1 : 50),
          maxLength: widget.maxLength,
          textInputAction: widget.textInputAction ?? TextInputAction.newline,
          onChanged: widget.onChanged,
          decoration: InputDecoration(hintText: widget.hintText ?? '${widget.prefix} ${widget.title}', errorText: widget.errorText),
          validator: widget.validator,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w300,
              ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
