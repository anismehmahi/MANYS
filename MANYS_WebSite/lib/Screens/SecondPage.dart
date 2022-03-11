import 'dart:typed_data';
import 'package:vrouter/vrouter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:Manys/Services/FirestoreService.dart';
import 'dart:ui' as ui;
import 'package:vrouter/vrouter.dart';
import 'package:latlong/latlong.dart';

// Recuperate the coordinates from Firebase
class SecondPage extends StatefulWidget {
  // String asset;
  // final String phoneToFind;
  // SecondPage({Key key, @required this.phoneToFind, @required this.asset}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  FirestoreService firestoreService = FirestoreService();

  MapController mapController = MapController();
  double currentZoom = 13;
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
     firestoreService.stopTracking();

}
  @override
  Widget build(BuildContext context) {
    final codeBar = context.vRouter.pathParameters['codeBar'];

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,

            ),

            child: IconButton(onPressed: (){
             if(currentZoom<20) currentZoom++;

              mapController.move(mapController.center, currentZoom);
            }, icon: Icon(Icons.add),
              color: Colors.black,

            ),
          ),
          SizedBox(height: 10,),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,

            ),
            child: IconButton(onPressed: (){
              if(currentZoom>5) currentZoom--;

              mapController.move(mapController.center, currentZoom);

            }, icon: Icon(Icons.remove)),
          ),
          SizedBox(height: 10,),

          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,

            ),

            child: IconButton( onPressed: () async {

              FirestoreService firestoreService = FirestoreService();
              // Navigator.of(context).pop();
              print('lll');
              await firestoreService.stopTracking();
              context.vRouter.pop();

            }, icon: Icon(Icons.stop),
              color: Colors.white,

            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
          //  Text("${widget.phoneToFind}"),
            StreamBuilder<DocumentSnapshot>(
                stream:
                    firestoreService.currentId(phoneToFind: codeBar),
                builder: (context, snapshot) {
                  if (snapshot.hasError){
                    return Center(child: Text("ERROR"),);
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data.data()["idOfDocToFollow"] != null) {
                      //return Center(child: Text("${snapshot.data["idOfDocToFollow"]}"),);
                      return StreamBuilder<QuerySnapshot>(
                          stream: firestoreService.track(
                              phoneToFind: codeBar,
                              id: snapshot.data.data()["idOfDocToFollow"]),
                          builder: (context, snapshot2) {
                            if (snapshot.hasError){
                              return Center(child: Text("ERROR"),);
                            }
                            if (snapshot2.hasData) {

                              if (snapshot2.data.docs.isNotEmpty) {

                           if(mapController.ready){
                             mapController?.move(LatLng(snapshot2
                                 .data.docs.last["Position"]
                                 .latitude, snapshot2
                                 .data.docs.last["Position"].longitude), mapController.zoom);
                           }

                                return Expanded(
                                  child: FlutterMap(
                                    mapController: mapController,
                                    options: new MapOptions(
                                        center:  LatLng(snapshot2
                                             .data.docs.last["Position"]
                                            .latitude, snapshot2
                                            .data.docs.last["Position"].longitude),
                                        zoom: 16.0,
                                        onTap: (latlng)
                                        {
                                          print("${mapController.zoom} ${latlng.latitude}");
                                        }
                                    ),
                                    layers: [
                                      TileLayerOptions(
                                        minZoom: 1,
                                        maxZoom: 19,
                                        backgroundColor: Colors.black,
                                        urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        subdomains: ['a', 'b', 'c'],
                                      ),

                                      MarkerLayerOptions(
                                        markers: [
                                          new Marker(
                                            point:  LatLng(snapshot2
                                                .data.docs.last["Position"]
                                                .latitude, snapshot2
                                                .data.docs.last["Position"].longitude),
                                            builder: (ctx) =>
                                            new FittedBox(
                                              child: Icon(Icons.location_on_rounded,color: Colors.black,),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),

                                );
                              }else{
                                return Align(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator());
                              }
                            } else {
                              return Container();
                            }
                          });
                    }
                    return Container();
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
