import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HistoryPolylines extends StatefulWidget {
  final List<LatLng> points;
  HistoryPolylines({Key key, @required this.points}) : super(key: key);
  @override
  _HistoryPolylinesState createState() => _HistoryPolylinesState();
}

class _HistoryPolylinesState extends State<HistoryPolylines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng( widget.points.first.latitude, widget.points.first.longitude),
          zoom: 20,
          tilt: 20,
        ),
        polylines: {
          Polyline(polylineId: PolylineId("test"), points: widget.points, width: 5, color: Colors.red),
        },
      ),
    );
  }
}