import 'package:flutter/material.dart';

export 'barrier_dialog.dart';
export 'progress_controller.dart';
export 'progress_hud.dart';

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
  // MEMO(tsuruoka): Future Work
  // final Duration timeout;
  final Color? backgroundColor;
  final bool useBoxIndicator;
  final Color? boxBackgroundColor;
  final String? label;
  final Widget? boxWidget;

  @override
  Widget build(BuildContext context) {
    final useBoxIndicator = this.useBoxIndicator || label != null;
    final boxWidget = this.boxWidget;
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
                    boxWidget == null
                        ? _CenteredIndicator(
                            useBoxIndicator: useBoxIndicator,
                            label: label,
                            boxBackgroundColor: boxBackgroundColor,
                            child: const CircularProgressIndicator(),
                          )
                        : _CenteredIndicator(
                            useBoxIndicator: useBoxIndicator,
                            label: label,
                            boxBackgroundColor: boxBackgroundColor,
                            child: boxWidget,
                          ),
                  ],
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class _CenteredIndicator extends StatelessWidget {
  const _CenteredIndicator({
    required this.useBoxIndicator,
    required this.boxBackgroundColor,
    required this.label,
    required this.child,
  });

  final bool useBoxIndicator;
  final Color? boxBackgroundColor;
  final String? label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: useBoxIndicator
          ? _DecoratedBox(
              label: label,
              backgroundColor: boxBackgroundColor,
              child: child,
            )
          : child,
    );
  }
}

class _DecoratedBox extends StatelessWidget {
  const _DecoratedBox({
    required this.child,
    this.label,
    this.backgroundColor,
  });

  final String? label;
  final Color? backgroundColor;
  final Widget child;

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
            child,
            if (label != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  label!,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
