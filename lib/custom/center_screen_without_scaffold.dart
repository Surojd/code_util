import 'dart:math';

import 'package:code_util/code_util.dart';
import 'package:flutter/material.dart';

class CenterScreenWithoutScaffold extends StatelessWidget {
  final ScrollController? controller;

  final bool havBNav;

  final AlignmentGeometry alignment;
  final RefreshIndicator Function(SingleChildScrollView scrollView)? refreshIndicator;

  final Widget? child;

  final bool havNav;

  final EdgeInsets? padding;

  final double? minWidth;

  const CenterScreenWithoutScaffold({
    super.key,
    required this.children,
    this.isLoading = false,
    this.controller,
    this.wrapper,
    this.havBNav = true,
    this.havNav = true,
    this.alignment = AlignmentDirectional.center,
    this.refreshIndicator,
    this.child,
    this.padding,
    this.minWidth,
  });

  final List<Widget> children;
  final bool isLoading;
  final Widget Function(Widget child)? wrapper;
  @override
  Widget build(BuildContext context) {
    final listview = ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const SizedBox(height: 10),
        ...children,
        const SizedBox(height: kBottomNavigationBarHeight + 10),
      ],
    );

    var singleScroll = SingleChildScrollView(
      controller: controller,
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: Utils.screenHeight(context) -
                (havNav ? kToolbarHeight : 0) -
                (havBNav ? kBottomNavigationBarHeight + 10 : 0),
            maxWidth: min(Utils.screenWidth(context), minWidth ?? 800),
          ),
          child: Align(
            alignment: alignment,
            child: wrapper?.call(listview) ?? listview,
          ),
        ),
      ),
    );
    return Stack(
      children: [
        Positioned.fill(child: child ?? refreshIndicator?.call(singleScroll) ?? singleScroll),
        if (isLoading) Utils.startLoading(context)
      ],
    );
  }
}
