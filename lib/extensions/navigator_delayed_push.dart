import 'package:flutter/cupertino.dart';

// ref. https://github.com/39works/mytradeApp/issues/19
// 通常のNavigatorPushの場合押下時のRipple Effectが見えないのでワンテンポ遅らせる処理

const seconds = 150;

extension NavigatorDelayedPush on NavigatorState {
  Future<T?> delayedPush<T extends Object?>(Route<T> route) async {
    await Future<void>.delayed(const Duration(milliseconds: seconds));
    return push(route);
  }

  Future<T?> delayedPushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: seconds));
    return pushNamed(routeName, arguments: arguments);
  }

  Future<T?> delayedPushReplacementNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: seconds));
    return pushReplacementNamed(routeName, arguments: arguments);
  }
}
