import 'package:flutter/material.dart';

class HeartButton extends StatelessWidget {
  final Function(BuildContext context)? onPressed;

  final Widget icon;

  final double size;

  final Color? backgroundColor;

  const HeartButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.size = 36,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 300),
      child: SizedBox(
        width: size,
        height: size,
        child: TextButton(
          onPressed: () => onPressed?.call(context),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            backgroundColor: backgroundColor != null ? MaterialStateProperty.all(backgroundColor) : null,
          ),
          child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 300),
            child: icon,
          ),
        ),
      ),
    );
  }
}
