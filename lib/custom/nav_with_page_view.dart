import 'dart:math';

import 'package:flutter/material.dart';

class NavPage extends StatefulWidget {
  final Widget? drawer;

  final PreferredSizeWidget? appBar;

  const NavPage({super.key, required this.getPages, this.drawer, this.appBar});
  final Widget Function(
      int page,
      void Function({
        int? page,
        bool with3,
        Map<String, dynamic>? data,
      }) onBackWith3) getPages;

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  final _pageController = PageController(initialPage: 0);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<int> _pages = [0];
  final Map<String, dynamic> _data = {};

  int _currentPage = 0;
  void _onBackWith3({
    int? page,
    bool with3 = false,
    Map<String, dynamic>? data = const {},
  }) {
    data?.forEach((key, value) => removeThenPut(key, value));
    if (with3) setState(() => _pages.add(page!));
    _pageController.animateToPage(_currentPage + (with3 ? 1 : -1), duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void removeThenPut(String key, dynamic value) {
    if (_data.containsKey(key)) _data.remove(key);
    _data.putIfAbsent(key, () => value);
    setState(() {});
  }

  dynamic get(String key) => _data[key];

  onPopInvoked(bool isPop) {
    _pageController.animateToPage(
      max(_currentPage - 1, 0),
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: onPopInvoked,
      canPop: _currentPage != 0,
      child: Scaffold(
        key: _scaffoldKey,
        extendBody: true,
        appBar: widget.appBar,
        bottomNavigationBar: const SizedBox(height: kBottomNavigationBarHeight),
        drawer: widget.drawer,
        body: SafeArea(
          child: PageView.builder(
            onPageChanged: (page) {
              FocusScope.of(context).unfocus();
              if (_pages.length > page + 1) {
                _pages.removeRange(page + 1, _pages.length);
              }
              if (_pages.isEmpty) _pages.add(0);
              setState(() => _currentPage = page);
            },
            controller: _pageController,
            physics: _currentPage == 0 ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
            itemCount: _pages.length,
            itemBuilder: (c, i) => widget.getPages(_pages[i], _onBackWith3),
          ),
        ),
      ),
    );
  }
}
