import 'package:example/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const title = 'tsuruo_kit example';
    return MaterialApp(
      title: title,
      home: HomePage(title: title),
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(),
      ),
    );
  }
}
