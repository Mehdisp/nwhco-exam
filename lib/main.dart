import 'package:flutter/material.dart';

import 'di/di.dart';
import 'config/app_theme.dart';
import 'features/main/presentation/pages/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const LookyApplication());
}

class LookyApplication extends StatelessWidget {
  const LookyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Looky',
      theme: AppTheme.def(),
      debugShowCheckedModeBanner: false,
      locale: Locale('en', 'US'),
      home: MainScreen(),
    );
  }
}

