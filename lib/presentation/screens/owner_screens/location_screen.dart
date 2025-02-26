import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/core/logic/board_cubit/board_cubit.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? mapController;
  LatLng? carLocation;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    final boardCubit = BlocProvider.of<BoardCubit>(context);
    boardCubit.getBoardData();
    boardCubit.connectToSocket();
  }

  @override
  void dispose() {
    mapController?.dispose();
    BlocProvider.of<BoardCubit>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardCubit, BoardState>(
      builder: (context, state) {
        if (state is BoardSuccess) {
          final data = state.res;

          if (data['Location'] != null &&
              data['Location']['Latitude'] != null &&
              data['Location']['Longitude'] != null) {
            carLocation = LatLng(
              double.parse(data['Location']['Latitude'].toString()),
              double.parse(data['Location']['Longitude'].toString()),
            );

            if (mapController != null && carLocation != null) {
              mapController!.animateCamera(
                CameraUpdate.newLatLngZoom(carLocation!, 10),
              );
            }
          }
        }

        return GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: carLocation ?? const LatLng(30.0444, 31.2357),
            zoom: 10,
          ),
          markers: carLocation != null
              ? {
                  Marker(
                    markerId: const MarkerId('car'),
                    position: carLocation!,
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue,
                    ),
                  ),
                }
              : {},
        );
      },
    );
  }
}
