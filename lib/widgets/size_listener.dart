import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ref. https://github.com/mono0926/flutter_mono_kit/blob/main/lib/widgets/size_listener.dart
// ref. https://qiita.com/najeira/items/0ff716971184042b1434

typedef _SizeChangedCallback = void Function(Size size);

class SizeListener extends SingleChildRenderObjectWidget {
  const SizeListener({
    super.key,
    super.child,
    required this.onSizeChanged,
  });
  final _SizeChangedCallback onSizeChanged;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _SizeListenerRenderObject(onSizeChanged: onSizeChanged);
}

class _SizeListenerRenderObject extends RenderProxyBox {
  _SizeListenerRenderObject({
    RenderBox? child,
    required this.onSizeChanged,
  }) : super(child);
  final _SizeChangedCallback onSizeChanged;

  Size? _size;

  @override
  void performLayout() {
    super.performLayout();

    final size = this.size;
    if (size != _size) {
      _size = size;
      WidgetsBinding.instance.addPostFrameCallback((_) => onSizeChanged(size));
    }
  }
}
