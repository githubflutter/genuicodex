import 'package:flutter/material.dart';

import 'screens/catalog_screen.dart';

class GenuicodexApp extends StatelessWidget {
  const GenuicodexApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: Brightness.light,
    );

    return MaterialApp(
      title: 'Genuicodex',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
        ),
      ),
      home: const CatalogScreen(),
    );
  }
}
