import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TimelineView extends StatelessWidget {
  final List<LatLng> locations;

  TimelineView({required this.locations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final location = locations[index];
        return TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.1,
          isFirst: index == 0,
          isLast: index == locations.length - 1,
          indicatorStyle: IndicatorStyle(
            width: 20,
            color: Colors.blue,
            padding: EdgeInsets.all(6),
          ),
          endChild: Container(
            constraints: BoxConstraints(
              minHeight: 80,
            ),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Location: ${location.latitude}, ${location.longitude}'),
            ),
          ),
        );
      },
    );
  }
}
