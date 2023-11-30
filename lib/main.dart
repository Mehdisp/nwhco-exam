import 'package:flutter/material.dart';

import 'di/di.dart';
import 'config/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lookey',
      theme: AppTheme.light(),
      debugShowCheckedModeBanner: false,
      // localization
      locale: Locale('en', 'US'),
      home: Placeholder(),
    );
  }
}
