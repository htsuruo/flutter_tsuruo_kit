import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// AppBar自体は表示したくないがiOSのステータスバーの色を制御したい時用
class TransparentAppBar extends StatelessWidget with PreferredSizeWidget {
  const TransparentAppBar({
    super.key,
    this.overlayStyle = SystemUiOverlayStyle.dark,
  });

  final SystemUiOverlayStyle overlayStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: overlayStyle,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.zero;
}
