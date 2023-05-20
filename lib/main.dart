import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu/bloc/blocs.dart';
import 'package:restaurant_menu/screens/screens.dart';
import 'package:restaurant_menu/screens/location_screen/locationscreens.dart';
import 'package:restaurant_menu/services/traffic_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PlatosBloc()),
        BlocProvider(create: (context) => LocationBloc()),
        BlocProvider(create: (context) => GpsBloc()),
        BlocProvider(
          create: (context) => MapBloc(
            locationBloc: BlocProvider.of<LocationBloc>(context),
            trafficService: TrafficService(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          // textTheme: GoogleFonts.poppinsTextTheme(
          //   Theme.of(context).textTheme,
          // ),
        ),
        title: 'Material App',
        // home: QuispeScreen()
        initialRoute: 'tabs',
        routes: {
          'tabs': (_) => TabsScreen(),
          'location': (_) => LocationScreen(),
          'loading': (_) => LoadingScreen(),
        },
      ),
    );
  }
}
