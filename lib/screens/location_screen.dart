import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/member.dart';
import '../widgets/timeline_view.dart';

class LocationScreen extends StatefulWidget {
  final Member member;
  LocationScreen({required this.member});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  final List<LatLng> visitedLocations = [
    LatLng(45.531563, -122.677433),
    LatLng(45.521563, -122.687433),
  ];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.member.name)),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: visitedLocations
                  .map((location) => Marker(
                        markerId: MarkerId(location.toString()),
                        position: location,
                      ))
                  .toSet(),
            ),
          ),
          Expanded(
            flex: 1,
            child: TimelineView(
              locations: visitedLocations,
            ),
          ),
        ],
      ),
    );
  }
}
