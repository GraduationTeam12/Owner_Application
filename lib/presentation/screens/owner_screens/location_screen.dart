import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/core/helper/location_helper.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? mapController;
  static Position? position;

  // static const LatLng _center = LatLng(30.0444, 31.2357);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );

  @override
  initState() {
    super.initState();
    getMyCurrentLocation();
  }

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(fit: StackFit.expand, children: [
        position != null
            ? GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: _myCurrentLocationCameraPosition,
                mapType: MapType.normal,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                markers: {
                  Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(position!.latitude, position!.longitude),
                      onTap: () {},
                      // infoWindow: InfoWindow(
                      //   title: 'My Location'),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueBlue)),
                },
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: MyColors.premiumColor,
                ),
              ),
      ])),
    );
  }
}
