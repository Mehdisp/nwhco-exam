import 'package:flutter/material.dart';

import '../widgets/main_bottom_navigation_bar.dart';
import '/routes.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Navigator(
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
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        /// to navigate between pages call [navigator.push]
        onItemClick: (index) {},
      ),
    );
  }

  /// returns a default widget to show when pushed route name not exists is [routes]
  Widget notFoundPage(BuildContext context) {
    return Center(
      child: Text('Page not found!'),
    );
  }
}
