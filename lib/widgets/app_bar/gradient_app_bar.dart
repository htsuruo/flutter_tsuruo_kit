import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GradientAppBar({
    Key? key,
    this.actions,
    this.title,
    this.centerTitle,
    required this.gradient,
    this.brightness,
  }) : super(key: key);

  final List<Widget>? actions;
  final Widget? title;
  final bool? centerTitle;
  final Gradient gradient;
  final Brightness? brightness;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: AppBar(
        title: title,
        centerTitle: centerTitle,
        textTheme: theme.textTheme,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: colorScheme.primary),
        actions: actions,
        elevation: 0,
        brightness: brightness ?? Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
