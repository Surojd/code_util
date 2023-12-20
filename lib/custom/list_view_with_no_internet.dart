import 'package:code_util/custom/center_screen_without_scaffold.dart';
import 'package:code_util/custom/no_internet.dart';
import 'package:flutter/material.dart';

class ListViewWithNoInternet<T> extends StatefulWidget {
  final bool isLoading;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

  final Future<void> Function({int page}) refreshList;

  final List<T> content;

  final bool last;

  final int page;

  final NullableIndexedWidgetBuilder itemBuilder;

  final Widget emptyWidget;

  final bool hasInternet;

  const ListViewWithNoInternet({
    super.key,
    required this.isLoading,
    required this.refreshIndicatorKey,
    required this.refreshList,
    required this.last,
    required this.page,
    required this.content,
    required this.itemBuilder,
    required this.emptyWidget,
    required this.hasInternet,
  });

  @override
  State<ListViewWithNoInternet> createState() => _ListViewWithNoInternetState();
}

class _ListViewWithNoInternetState extends State<ListViewWithNoInternet> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent - 100) {
      if (widget.isLoading || !widget.hasInternet || widget.last) return;
      widget.refreshList(page: widget.page + 1);
    }
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CenterScreenWithoutScaffold(
      alignment: widget.content.isNotEmpty ? Alignment.topCenter : Alignment.center,
      isLoading: widget.isLoading,
      controller: controller,
      refreshIndicator: (child) => RefreshIndicator(
        key: widget.refreshIndicatorKey,
        onRefresh: widget.refreshList,
        color: Theme.of(context).colorScheme.primary,
        child: child,
      ),
      children: [
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.content.length,
          padding: EdgeInsets.zero,
          itemBuilder: widget.itemBuilder,
        ),
        if (widget.isLoading) widget.itemBuilder(context, -1)! else if (widget.content.isEmpty) ...[widget.emptyWidget],
        if (widget.hasInternet && !widget.last) widget.itemBuilder(context, -1)!,
        if (!widget.hasInternet) NoInternet(onTap: widget.refreshList),
        const SizedBox(height: kBottomNavigationBarHeight + 10)
      ],
    );
  }
}
