import 'package:flutter/material.dart';

// ListView.separatedのSliver版
class SliverListViewSeparated extends StatelessWidget {
  const SliverListViewSeparated({
    super.key,
    required this.itemBuilder,
    required this.separatorBuilder,
    required this.childCount,
    this.pageStorageKey,
  });

  final PageStorageKey<String>? pageStorageKey;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final int childCount;

  @override
  Widget build(BuildContext context) {
    final childDelegate = SliverChildBuilderDelegate(
      (context, index) {
        if (index < childCount - 1) {
          return Column(
            children: [
              itemBuilder(context, index),
              separatorBuilder(context, index),
            ],
          );
        }
        return itemBuilder(context, index);
      },
      childCount: childCount,
    );
    return SliverList(
      key: pageStorageKey ?? const PageStorageKey(''),
      delegate: childDelegate,
    );
  }
}
