import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_menu/bloc/blocs.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  final Set<Polyline> polylines;
  final Set<Marker> markers;
  const MapView({
    super.key,
    required this.initialLocation,
    required this.polylines,
    required this.markers,
  });

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final CameraPosition initailCameraPosition =
        CameraPosition(target: initialLocation, zoom: 15);
    return Listener(
      onPointerMove: (pointerMoveEvent) {
        mapBloc.add(OnStopFollowingUserEvent());
      },
      child: GoogleMap(
        initialCameraPosition: initailCameraPosition,
        compassEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        polylines: polylines,
        markers: markers,
        onMapCreated: (controller) =>
            mapBloc.add(OnMapInitializedEvent(controller)),
        onCameraMove: (position) => mapBloc.mapCenter = position.target,
      ),
    );
  }
}
