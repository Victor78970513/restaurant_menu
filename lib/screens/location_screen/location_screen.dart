import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_menu/bloc/blocs.dart';

import 'package:restaurant_menu/view/map_view.dart';
import 'package:restaurant_menu/widgets/widgets.dart';

class LocationScreen extends StatefulWidget {
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late LocationBloc locationBloc = BlocProvider.of<LocationBloc>(context);
  @override
  void initState() {
    locationBloc.startFollowingUser();
    super.initState();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    const Marker marker = Marker(
        position: LatLng(
          -16.4985065423747,
          -68.1396478468924,
        ),
        markerId: MarkerId('RESTAURANTE'));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Restaurant Location',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 37,
            )),
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationstate) {
          if (locationstate.lastKnowLocation == null) {
            return const Center(child: Text('Espere Porfavor....'));
          }
          return BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {
              Map<String, Polyline> polylines = Map.from(mapState.polylines);

              return Center(
                  child: Column(
                children: [
                  Container(
                    height: 510,
                    width: 315,
                    margin: EdgeInsets.only(bottom: 19),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: MapView(
                        initialLocation: locationstate.lastKnowLocation!,
                        // initialLocation:
                        //     LatLng(-16.4985065423747, -68.1396478468924),
                        polylines: polylines.values.toSet(),
                        markers: {
                          marker,
                        },
                      ),
                    ),
                  ),
                  const Text(
                    'Calle Sagarnaga #339',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 19),
                  CustomButtonWidget(
                    text: 'Let\'s Get Route',
                    icon: FontAwesomeIcons.map,
                    width: 300,
                    onTap: () async {
                      print('funcionando');
                      final start = locationBloc.state.lastKnowLocation;
                      if (start == null) return;
                      final end = LatLng(
                        marker.position.latitude,
                        marker.position.longitude,
                      );

                      final destination =
                          await mapBloc.getCoorsStartToEnd(start, end);

                      await mapBloc.drawRoutePolyline(destination);
                    },
                  )
                ],
              ));
            },
          );
        },
      ),
    );
  }
}
