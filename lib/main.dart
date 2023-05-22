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
                trafficService: TrafficService())),
        BlocProvider(create: (context) => ShowBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashColor: Colors.orange,
          useMaterial3: true,
        ),
        title: 'Material App',
        initialRoute: 'tabs',
        routes: {
          'tabs': (_) => TabsScreen(),
          'location': (_) => LocationScreen(),
          'loading': (_) => LoadingScreen(),
          'show': (_) => ShowScreen(),
        },
      ),
    );
  }
}
