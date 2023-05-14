import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/screens/screens.dart';
import 'package:restaurant_menu/screens/tabs_screen.dart';
import 'package:restaurant_menu/widgets/custom_navigationbar_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          )),
      title: 'Material App',
      initialRoute: 'tabs',
      routes: {
        'tabs': (_) => TabsScreen(),
        'home': (_) => HomeScreen(),
        'dish': (_) => DishScreen(),
        'table': (_) => TableScreen(),
        'profile': (_) => ProfileScreen(),
      },
    );
  }
}
