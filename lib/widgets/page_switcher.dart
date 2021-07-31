import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

// IndexedStackだと、非表示ページのアニメーションなども裏で動き続ける問題があるので、
// それがケアされたVisibilityで制御しつつStateは維持するように指定
/// [pages]の中から、[index]のpageだけを表示
///
/// 非表示のpageも、状態は維持されるが、アニメーションの実行などは止まる(IndexedStackとの違い)
class PageSwitcher extends StatelessWidget {
  const PageSwitcher({
    Key? key,
    required this.pages,
    this.index = 0,
  }) : super(key: key);

  final List<Widget> pages;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: pages
          .mapIndexed(
            (index, page) => Visibility(
              visible: index == this.index,
              maintainState: true,
              child: page,
            ),
          )
          .toList(),
    );
  }
}
