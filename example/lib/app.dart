import 'package:example/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

Map<String, WidgetBuilder> _routes = {
  // routeName: (context) => Page Class
  PlaygroundPage.routeName: (context) => PlaygroundPage(),
};

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const title = 'tsuruo_kit example';
    return MaterialApp(
      title: title,
      home: PlaygroundBuilder(
        title: title,
        routes: _routes,
      ),
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(),
      ),
      routes: _routes,
    );
  }
}
