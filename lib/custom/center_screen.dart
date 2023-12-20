import 'package:flutter/material.dart';

import 'center_screen_without_scaffold.dart';

class CenterScreen extends StatelessWidget {
  final List<Widget> children;
  final Widget? child;

  final bool isLoading;

  final PreferredSizeWidget? appBar;

  final bool extendBody;

  final Widget Function(Widget child)? wrapper;

  final ScrollController? controller;

  final Widget? bottomNavigationBar;

  final FloatingActionButton? floatingActionButton;

  final AlignmentGeometry? alignment;

  final bool havBNav;

  final bool havNav;

  final RefreshIndicator Function(SingleChildScrollView scrollView)? refreshIndicator;

  final double? minWidth;

  const CenterScreen({
    super.key,
    this.children = const [],
    this.isLoading = false,
    this.appBar,
    this.extendBody = false,
    this.wrapper,
    this.controller,
    this.bottomNavigationBar,
    this.child,
    this.floatingActionButton,
    this.alignment,
    this.havBNav = true,
    this.havNav = true,
    this.refreshIndicator,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBody: extendBody,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        body: child ??
            CenterScreenWithoutScaffold(
              isLoading: isLoading,
              controller: controller,
              wrapper: wrapper,
              alignment: alignment ?? Alignment.center,
              havBNav: havBNav,
              havNav: havNav,
              refreshIndicator: refreshIndicator,
              minWidth: minWidth,
              children: children,
            ),
        appBar: appBar,
      ),
    );
  }
}
