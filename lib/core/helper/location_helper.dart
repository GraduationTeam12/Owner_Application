// // ignore_for_file: deprecated_member_use, use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:user_app/presentation/screens/owner_screens/home_screen.dart';

// class LocationHelper {
//   static Future<dynamic> getCurrentLocation(BuildContext context) async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       throw Exception('Location services are disabled.');
//     }

//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // throw Exception('Location permissions are denied');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Location permissions are denied')),
//         );
//         return Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => HomeScreen(
//                       index: 0,
//                     )),
//             (routes) => false);
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//               'Please enable location permission from your device setting'),
//           duration: Duration(seconds: 5),
//         ),
//       );
//       return Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//               builder: (context) => HomeScreen(
//                     index: 0,
//                   )),
//           (routes) => false);
//     }

//     return await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//   }
// }
