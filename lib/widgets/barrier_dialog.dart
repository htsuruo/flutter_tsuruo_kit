import 'package:flutter/material.dart';

class BarrierDialog extends StatelessWidget {
  const BarrierDialog({
    Key? key,
    this.show = false,
    required this.title,
    required this.child,
    this.actions,
    this.backgroundColor,
  }) : super(key: key);

  final Widget title;
  final Widget child;
  final List<Widget>? actions;
  final bool show;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final size = double.infinity;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: show
          ? Stack(
              children: [
                // backgroundColorをそのまま背面にしても良かったが
                // 暗い印象を与えたかったので`.black.withOpacity(.4)`を重ねるのを必須にした
                if (backgroundColor != null)
                  Container(
                    color: backgroundColor!,
                    width: size,
                    height: size,
                  ),
                Container(
                  color: Colors.black.withOpacity(.4),
                  width: size,
                  height: size,
                ),
                SafeArea(
                  child: AlertDialog(
                    title: title,
                    scrollable: true,
                    content: child,
                    actions: actions,
                  ),
                ),
              ],
            )
          : SizedBox.shrink(),
    );
  }
}
