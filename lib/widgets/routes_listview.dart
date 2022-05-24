import 'package:flutter/material.dart';

/// - [RoutesListView] is ListView Wrapper needs [routes]
class RoutesListView extends StatelessWidget {
  const RoutesListView({super.key, required this.routes});
  final Map<String, WidgetBuilder> routes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final route = routes.entries.toList()[index];
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
      itemCount: routes.length,
    );
  }
}
