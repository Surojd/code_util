import 'dart:math';

import 'package:code_util/code_util.dart';
import 'package:flutter/material.dart';

class CenterWidth extends StatelessWidget {
  final Widget child;

  final EdgeInsets? padding;

  final double? minWidth;

  final Alignment? alignment;

  const CenterWidth({super.key, required this.child, this.padding, this.minWidth, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.topCenter,
      child: Container(
        padding: padding,
        constraints: BoxConstraints(
          maxWidth: min(Utils.screenWidth(context), minWidth ?? 800),
        ),
        child: child,
      ),
    );
  }
}
