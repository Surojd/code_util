import 'dart:math';
import 'dart:ui';

import 'package:code_util/code_util.dart';
import 'package:flutter/material.dart';

class BlurEffect extends StatelessWidget {
  final List<Widget> children;

  final EdgeInsets? padding;
  final double height;

  const BlurEffect({
    super.key,
    required this.children,
    this.padding,
    this.height = kBottomNavigationBarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Theme.of(context).colorScheme.background.withOpacity(0.2),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.background.withOpacity(0.08),
                offset: const Offset(0, -1),
                blurRadius: 20,
              ),
            ],
          ),
          height: kBottomNavigationBarHeight,
          padding: padding,
          child: Center(
            child: SizedBox(
              width: min(Utils.screenWidth(context), 800),
              child: Flex(
                direction: Axis.horizontal,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
