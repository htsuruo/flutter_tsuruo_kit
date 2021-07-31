import 'package:flutter/material.dart';

/// AppBar自体は表示したくないがiOSのステータスバーの色を制御したい時用
class TransparentAppBar extends StatelessWidget with PreferredSizeWidget {
  const TransparentAppBar({
    Key? key,
    this.brightness = Brightness.light,
  }) : super(key: key);

  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: brightness,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.zero;
}
