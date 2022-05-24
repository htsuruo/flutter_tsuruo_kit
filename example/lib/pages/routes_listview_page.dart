import 'package:flutter/material.dart';

Map<String, WidgetBuilder> _routes = {
  // routeName: (context) => Page Class
  _HogePage.routeName: (context) => const _HogePage(),
  _PiyoPage.routeName: (context) => const _PiyoPage(),
};

class RoutesListViewPage extends StatelessWidget {
  const RoutesListViewPage({super.key});
  static const routeName = '/routes_listview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(routeName),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final route = _routes.entries.toList()[index];
          return ListTile(
            title: Text(route.key),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(builder: route.value),
              );
            },
          );
        },
        separatorBuilder: (context, _) => const Divider(),
        itemCount: _routes.length,
      ),
    );
  }
}

class _HogePage extends StatelessWidget {
  const _HogePage();

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
  const _PiyoPage();

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
