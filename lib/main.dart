import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_menu/bloc/gps/gps_bloc.dart';
import 'package:restaurant_menu/bloc/platos/platos_bloc.dart';
import 'package:restaurant_menu/screens/location_screen/locationscreens.dart';
import 'package:restaurant_menu/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PlatosBloc()),
        BlocProvider(create: (context) => GpsBloc()),
      ],
      child: MaterialApp(
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
          'location': (_) => LocationScreen(),
          'loading': (_) => LoadingScreen()
        },
      ),
    );
  }
}
