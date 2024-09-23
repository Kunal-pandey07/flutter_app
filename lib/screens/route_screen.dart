import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/member.dart';

class RouteScreen extends StatefulWidget {
  final Member member;

  RouteScreen({required this.member});

  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  late GoogleMapController mapController;
  final LatLng startLocation = LatLng(45.531563, -122.677433);
  final LatLng stopLocation = LatLng(45.521563, -122.687433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.member.name + ' Route')),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: startLocation,
                zoom: 11.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('start'),
                  position: startLocation,
                ),
                Marker(
                  markerId: MarkerId('stop'),
                  position: stopLocation,
                ),
              },
              polylines: {
                Polyline(
                  polylineId: PolylineId('route'),
                  points: [startLocation, stopLocation],
                  color: Colors.blue,
                  width: 5,
                ),
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('Start: ${startLocation.latitude}, ${startLocation.longitude}'),
                Text('Stop: ${stopLocation.latitude}, ${stopLocation.longitude}'),
                Text('Total Distance: X km'),
                Text('Total Duration: Y minutes'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
