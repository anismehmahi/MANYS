
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:Manys/Services/FirestoreService.dart';
import 'package:latlong/latlong.dart';

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}


class _TestAppState extends State<TestApp> {
  @override
  void initState() {
    super.initState();
  }
  MapController mapController = MapController();
double currentZoom = 13;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Container(
            color: Colors.red,

            child: IconButton(onPressed: (){
              currentZoom++;
              mapController.move(mapController.center, currentZoom);
            }, icon: Icon(Icons.add),
            color: Colors.black,

            ),
          ),
          Container(
            color: Colors.red,
            child: IconButton(onPressed: (){
              currentZoom--;
              mapController.move(mapController.center, currentZoom);

            }, icon: Icon(Icons.remove)),
          ),
          Container(
          color: Colors.red,

          child: IconButton( onPressed: () async {
            FirestoreService firestoreService = FirestoreService();

            await firestoreService.stopTracking();
            Navigator.of(context).pop();
          }, icon: Icon(Icons.stop),
            color: Colors.black,

          ),
        )
        ],
      ),
      body: new FlutterMap(
        mapController: mapController,
        options: new MapOptions(
          center:  LatLng(36.71748668885022, 3.1550702989804544),
          zoom: 13.0,
          onTap: (latlng){
            print("${latlng.longitude} ${latlng.latitude}");
          }
        ),
        layers: [
          TileLayerOptions(
            minZoom: 1,
            maxZoom: 18,
            backgroundColor: Colors.black,
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),

          MarkerLayerOptions(
            markers: [
              new Marker(
                width: 80.0,
                height: 80.0,
                point:  LatLng(36.71748668885022, 3.1550702989804544),
                builder: (ctx) =>
                new Container(
                  child: Icon(Icons.add_location),
                ),
              ),
            ],
          ),
          PolylineLayerOptions(
            polylines: [
              Polyline(
                  points: [
            LatLng(36.71694659930191,3.1551153625147865),
            LatLng(          36.716905318196005,3.154621836056047
            ),
            LatLng(          36.71687435731923,3.1542656387316113
            ),
            LatLng(         36.716805555442775, 3.1534545386600232
            ),
            LatLng(        36.71720116539086,  3.153334375687971
            ),

                  ],
                  strokeWidth: 4.0,
                  color: Colors.purple),
            ],
          ),
        ],
      ),
    );
  }
}
