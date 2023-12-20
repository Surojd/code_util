import 'dart:math';

import 'package:code_util/code_util.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final void Function(int i)? onTap;

  final TabController? controller;

  final List<Tab> tabs;

  final Color? backgroundColor;
  final Color? tabColor;

  final BorderRadius? borderRadius;

  final bool isScrollable;

  final Border? shape;

  const CustomTabBar({
    super.key,
    required this.tabs,
    this.onTap,
    this.controller,
    this.backgroundColor,
    this.tabColor,
    this.borderRadius,
    this.isScrollable = false,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils.screenWidth(context),
      height: kToolbarHeight,
      decoration: ShapeDecoration(
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        shape: shape ??
            Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor),
            ),
      ),
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.bottomLeft,
        width: min(Utils.screenWidth(context), 800),
        decoration: BoxDecoration(
          color: tabColor ?? Theme.of(context).scaffoldBackgroundColor,
          borderRadius: borderRadius ??
              const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
        ),
        child: TabBar(
          controller: controller,
          onTap: onTap,
          tabs: tabs,
          isScrollable: isScrollable,
        ),
      ),
    );
  }
}
