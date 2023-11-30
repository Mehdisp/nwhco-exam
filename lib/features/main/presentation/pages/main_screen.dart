import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/main_bottom_navigation_bar.dart';
import '/routes.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Navigator(
        key: _navigatorKey,
        initialRoute: 'home',
        onGenerateRoute: (settings) {
          final page = routes[settings.name] ?? notFoundPage;
          return MaterialPageRoute(
            settings: settings,
            builder: page,
          );
        },
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        onItemClick: (index) {},
      ),
    );
  }

  Widget notFoundPage(BuildContext context) {
    return Center(
      child: Text('Page not found!'),
    );
  }
}
