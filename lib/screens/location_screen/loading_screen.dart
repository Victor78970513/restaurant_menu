import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_menu/bloc/blocs.dart';
import 'package:restaurant_menu/screens/location_screen/locationscreens.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        return state.isAllGranted ? LocationScreen() : GpsAccessScreen();
      },
    );
  }
}
