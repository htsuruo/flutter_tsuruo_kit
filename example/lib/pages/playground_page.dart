import 'package:flutter/material.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

Map<String, WidgetBuilder> _routes = {
  // routeName: (context) => Page Class
  _HogePage.routeName: (context) => const _HogePage(),
  _PiyoPage.routeName: (context) => const _PiyoPage(),
};

class PlaygroundPage extends StatelessWidget {
  const PlaygroundPage({Key? key}) : super(key: key);
  static const routeName = '/playground';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlaygroundBuilder(
        title: runtimeType.toString(),
        routes: _routes,
      ),
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
      ),
      routes: _routes,
    );
  }
}

class _HogePage extends StatelessWidget {
  const _HogePage({Key? key}) : super(key: key);

  static const routeName = '/hoge';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
    );
  }
}

class _PiyoPage extends StatelessWidget {
  const _PiyoPage({Key? key}) : super(key: key);

  static const routeName = '/piyo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
    );
  }
}
