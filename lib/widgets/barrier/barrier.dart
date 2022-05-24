import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  const Barrier({
    super.key,
    required this.child,
    required this.show,
    this.switchDuration = const Duration(milliseconds: 300),
    // this.timeout = const Duration(seconds: 30),
    this.backgroundColor,
    this.useBoxIndicator = false,
    this.boxBackgroundColor,
    this.boxWidget,
    this.label,
  });

  final Widget child;
  final bool show;
  final Duration switchDuration;
  // TODO(tsuruoka): future work
  // final Duration timeout;
  final Color? backgroundColor;
  final bool useBoxIndicator;
  final Color? boxBackgroundColor;
  final String? label;
  final Widget? boxWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        AnimatedSwitcher(
          duration: switchDuration,
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: show
              ? Stack(
                  children: [
                    ModalBarrier(
                      color: backgroundColor ?? Colors.black45,
                      dismissible: false,
                    ),
                    boxWidget ??
                        Center(
                          child: useBoxIndicator || label != null
                              ? _BoxIndicator(
                                  label: label,
                                  backgroundColor: boxBackgroundColor,
                                )
                              : const CircularProgressIndicator(),
                        ),
                  ],
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class _BoxIndicator extends StatelessWidget {
  const _BoxIndicator({
    super.key,
    this.label,
    this.backgroundColor,
  });

  final String? label;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor ?? theme.scaffoldBackgroundColor,
      ),
      child: Padding(
        padding: label == null
            ? const EdgeInsets.all(28)
            : const EdgeInsets.all(20).copyWith(bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            if (label != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  label!,
                  style: theme.textTheme.bodyText2,
                ),
              )
          ],
        ),
      ),
    );
  }
}
