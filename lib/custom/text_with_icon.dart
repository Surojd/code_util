import 'package:code_util/code_util.dart';
import 'package:flutter/material.dart';

class TextWithIcon extends StatelessWidget {
  final IconData icon;

  final double? width;
  final void Function()? onTap;

  final double? radius;

  final EdgeInsets? padding;
  const TextWithIcon({
    super.key,
    required this.text,
    required this.icon,
    this.width,
    this.onTap,
    this.radius,
    this.padding,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      key: key,
      radius: radius,
      child: Container(
        padding: padding,
        constraints: BoxConstraints(
          maxWidth: (width ?? Utils.screenWidth(context)) * .9,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
