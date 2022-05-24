import 'package:flutter/material.dart';

// AutomaticKeepAliveClientMixinを適用させるためのWidget
// 主にTabBarなどStateを保持したい箇所で利用する
class AutomaticKeepAliveClient extends StatefulWidget {
  const AutomaticKeepAliveClient({
    super.key,
    required this.child,
  });
  @override
  _AutomaticKeepAliveClientState createState() =>
      _AutomaticKeepAliveClientState();

  final Widget child;
}

class _AutomaticKeepAliveClientState extends State<AutomaticKeepAliveClient>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
