import 'package:flutter/material.dart';

import 'package:meals_app/screens/tabs.dart';
import 'main.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      debugShowCheckedModeBanner: false,
      home: const TabsScreen(),
      theme: theme,
    );
  }
}
