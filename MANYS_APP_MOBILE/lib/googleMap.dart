import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MapSample extends StatefulWidget {
  final double _x;
  final double _y;
  const MapSample(this._x, this._y);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

 Set<Marker> markers = {};
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    markers.add(   Marker(markerId: MarkerId('1'),
      position: LatLng(widget._x,widget._y),
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(
          target: LatLng(widget._x, widget._y),
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      markers: markers,
      );
  }

}
