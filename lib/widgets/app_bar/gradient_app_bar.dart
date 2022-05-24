import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GradientAppBar({
    super.key,
    this.actions,
    this.title,
    this.centerTitle,
    required this.gradient,
    this.overlayStyle,
  });

  final List<Widget>? actions;
  final Widget? title;
  final bool? centerTitle;
  final Gradient gradient;
  final SystemUiOverlayStyle? overlayStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: AppBar(
        title: title,
        centerTitle: centerTitle,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: colorScheme.primary),
        actions: actions,
        elevation: 0,
        systemOverlayStyle: overlayStyle ?? SystemUiOverlayStyle.light,
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
