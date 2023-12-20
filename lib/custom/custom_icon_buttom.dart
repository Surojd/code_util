import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function()? onTap;

  final IconData icon;

  final Color? color;

  const CustomIconButton({super.key, this.onTap, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: Icon(
            icon,
            size: 18,
            color: color,
            key: ValueKey<IconData>(icon),
          ),
        ),
      ),
    );
  }
}
