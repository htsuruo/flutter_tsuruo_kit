import 'package:flutter/material.dart';

class SmoothHighlight extends StatefulWidget {
  const SmoothHighlight({
    super.key,
    required this.child,
    this.highlightColor,
    this.enabled = true,
  });

  final Widget child;
  final Color? highlightColor;
  final bool enabled;

  @override
  State<SmoothHighlight> createState() => _SmoothHighlightState();
}

class _SmoothHighlightState extends State<SmoothHighlight>
    with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  late final Animation<Decoration> _animation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animation = _animationController
        .drive(
          CurveTween(curve: Curves.easeInOut),
        )
        .drive(
          DecorationTween(
            begin: const BoxDecoration(),
            end: BoxDecoration(
              color: widget.highlightColor ?? Theme.of(context).primaryColor,
            ),
          ),
        );
    _animation.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future<void>.delayed(const Duration(milliseconds: 200));
        await _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.enabled
        ? DecoratedBoxTransition(
            decoration: _animation,
            child: widget.child,
          )
        : widget.child;
  }
}
