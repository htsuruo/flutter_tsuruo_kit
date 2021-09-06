import 'dart:async';

import 'package:flutter/material.dart';

class TimeoutSwitcher extends StatefulWidget {
  const TimeoutSwitcher({
    Key? key,
    required this.duration,
    required this.child,
    this.initialChild = const SizedBox.shrink(),
  }) : super(key: key);

  final Duration duration;
  final Widget initialChild;
  final Widget child;

  @override
  _TimeoutSwitcherState createState() => _TimeoutSwitcherState();
}

class _TimeoutSwitcherState extends State<TimeoutSwitcher> {
  bool timeout = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(widget.duration, () {
      setState(() {
        timeout = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: timeout ? widget.child : widget.initialChild,
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
