import 'package:flutter/material.dart';

class PasswrodTextField extends StatefulWidget {
  final String? errorText;

  final String? labelText;

  final TextEditingController? controller;

  final String? Function(String?)? validator;

  final void Function(String)? onFieldSubmitted;

  final String? helperText;

  final TextInputAction? textInputAction;

  final void Function(String)? onChanged;

  const PasswrodTextField({
    super.key,
    this.errorText,
    this.validator,
    this.labelText,
    this.controller,
    this.onFieldSubmitted,
    this.helperText,
    this.textInputAction,
    this.onChanged,
  });

  @override
  State<PasswrodTextField> createState() => _PasswrodTextFieldState();
}

class _PasswrodTextFieldState extends State<PasswrodTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      obscureText: !showPassword,
      controller: widget.controller,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        helperText: widget.helperText ?? "",
        errorText: widget.errorText,
        labelText: widget.labelText,
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
        suffixIcon: IconButton(
          focusNode: FocusNode(skipTraversal: true),
          key: null,
          icon: Icon(
            showPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            color: const Color(0xff8C8989),
            size: 16,
          ),
          onPressed: () {
            showPassword = !showPassword;
            setState(() {});
          },
        ),
      ),
    );
  }
}
