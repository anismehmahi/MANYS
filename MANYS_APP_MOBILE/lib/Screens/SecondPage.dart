import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:koko/Services/FirestoreService.dart';
import 'dart:ui' as ui;


// Recuperate the coordinates from Firebase
class SecondPage extends StatefulWidget {
  String asset;
  final String phoneToFind;
  SecondPage({Key key, @required this.phoneToFind, @required this.asset}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  FirestoreService firestoreService = FirestoreService();
  GoogleMapController mapcontroller ;
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    markerIcon = (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }
  Uint8List markerIcon;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTracking();
    getBytesFromAsset(widget.asset, 70);


  }
  startTracking() async {
    FirestoreService firestoreService = FirestoreService();
    await firestoreService.startTrackingCar(
      phoneToFind: widget.phoneToFind,
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
     firestoreService.stopTracking();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            FutureBuilder(
              future: Future.delayed(Duration(seconds: 2) , (){
                return true;
              }),

              builder: (BuildContext context, AsyncSnapshot<dynamic> cc) {
                if(cc.hasData){
                  return StreamBuilder<DocumentSnapshot>(
                      stream:
                      firestoreService.currentId(phoneToFind: widget.phoneToFind),
                      builder: (context, snapshot) {
                        if (snapshot.hasError){
                          return Center(child: Text("ERROR"),);
                        }
                        if (snapshot.hasData) {
                          if (snapshot.data?.data["idOfDocToFollow"] != null) {
                            //return Center(child: Text("${snapshot.data["idOfDocToFollow"]}"),);
                            return StreamBuilder<QuerySnapshot>(
                                stream: firestoreService.track(
                                    phoneToFind: widget.phoneToFind,
                                    id: snapshot.data.data["idOfDocToFollow"]),
                                builder: (context, snapshot2) {
                                  if (snapshot.hasError)
                                  {
                                    return Center(child: Text("ERROR"),);
                                  }
                                  if (snapshot2.hasData) {

                                    if (snapshot2.data.documents.isNotEmpty) {
                                      mapcontroller?.animateCamera(CameraUpdate.newLatLng(
                                        LatLng( snapshot2
                                            .data.documents.last["Position"]
                                            .latitude, snapshot2
                                            .data.documents.last["Position"].longitude),

                                      ));
                                      return Expanded(
                                        // height: 600,
                                        // width: double.infinity,
                                        child: GoogleMap(
                                          minMaxZoomPreference: MinMaxZoomPreference(
                                              0,18
                                          ),
                                          onMapCreated: (GoogleMapController controller)  {
                                            setState(() {
                                              mapcontroller= controller;
                                            });


                                          },
                                          initialCameraPosition: CameraPosition(
                                            target: LatLng( snapshot2
                                                .data.documents.last["Position"]
                                                .latitude, snapshot2
                                                .data.documents.last["Position"].longitude),
                                            zoom: 17,
                                            //  tilt: 20,
                                          ),
                                          markers: {
                                            Marker(

                                                icon:BitmapDescriptor.fromBytes(markerIcon),

                                                markerId: MarkerId(""),
                                                position: LatLng(
                                                    snapshot2
                                                        .data.documents[snapshot2.data.documents
                                                        .length -
                                                        1]["Position"]
                                                        .latitude,
                                                    snapshot2
                                                        .data
                                                        .documents[snapshot2.data.documents
                                                        .length -
                                                        1]["Position"]
                                                        .longitude),
                                                rotation: snapshot2.data.documents.last.data["heading"]
                                            )
                                          },
                                        ),
                                      );
                                    }
                                    else{
                                      return Center(child: CircularProgressIndicator(),);
                                    }
                                  } else {
                                    return Container();
                                  }
                                });
                          }
                          return Container();
                        } else {
                          return Container();
                        }
                      });
                }
                  else{
                    return
                    Center(
                      child: CircularProgressIndicator()
                    );
                }
              },

            ),
          ],
        ),
      ),
    );
  }
}
