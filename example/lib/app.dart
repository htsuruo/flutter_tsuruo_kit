import 'package:example/pages/pages.dart';
import 'package:example/pages/progress_page.dart';
import 'package:flutter/material.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

Map<String, WidgetBuilder> _routes = {
  // routeName: (context) => Page Class
  RoutesListViewPage.routeName: (context) => const RoutesListViewPage(),
  BarrierPage.routeName: (context) => const BarrierPage(),
  ProgressPage.routeName: (context) => const ProgressPage(),
};

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const title = 'tsuruo_kit example';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(runtimeType.toString()),
        ),
        body: RoutesListView(routes: _routes),
      ),
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
      ).copyWith(
        dividerTheme: const DividerThemeData(space: 0),
      ),
      routes: _routes,
    );
  }
}
