import 'package:flutter/material.dart';

/// - [PlaygroundBuilder] is Scaffold Wrapper with ListView
/// - must use with MaterialApp because needs [routes]
class PlaygroundBuilder extends StatelessWidget {
  const PlaygroundBuilder({
    Key? key,
    required this.title,
    required this.routes,
  }) : super(key: key);

  final String title;
  final Map<String, WidgetBuilder> routes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final route = routes.entries.toList()[index];
          return ListTile(
            title: Text(route.key),
            onTap: () => Navigator.of(context).pushNamed(route.key),
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 0),
        itemCount: routes.length,
      ),
    );
  }
}
