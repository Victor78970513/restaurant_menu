import 'package:flutter/material.dart';
import 'package:restaurant_menu/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (context) => LoginScreen(),
      },
    );
  }
}
