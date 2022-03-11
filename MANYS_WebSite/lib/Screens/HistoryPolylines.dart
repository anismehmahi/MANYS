import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class HistoryPolylines extends StatefulWidget {
  final List<LatLng> points;
  HistoryPolylines({Key key,  this.points}) : super(key: key);
  @override
  _HistoryPolylinesState createState() => _HistoryPolylinesState();
}

class _HistoryPolylinesState extends State<HistoryPolylines> {
  MapController mapController = MapController();
  double currentZoom = 15;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);

      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar:MediaQuery.of(context).size.width>800 ?null: AppBar(
        elevation: 0,
          backgroundColor: Colors.transparent,

        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            MediaQuery.of(context).size.width>800 ? Container():  Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent,

              ),

              child: IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: Icon(Icons.close),
                color: Colors.white,

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
          ],
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: new MapOptions(
                center:  LatLng(widget.points.first
                    .latitude, widget.points.first.longitude),
                zoom: 16,

              ),
              layers: [
                TileLayerOptions(
                  minZoom: 1,
                  maxZoom: 19,
                  backgroundColor: Colors.black,
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                PolylineLayerOptions(
                  polylines: [
                    Polyline(

                        points: widget.points,
                        strokeWidth: 5.0,
                        color: Colors.purple),
                  ],
                ),

              ],
            ),
            MediaQuery.of(context).size.width>800 ?Positioned.fill(
              bottom: 15,
              child:
            Align(
              alignment: Alignment.bottomCenter,

              child:  Material(
                color: Colors.transparent,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () async{
                    Navigator.pop(context);

                  },
                  borderRadius: BorderRadius.circular(30),

                  child:  Ink(
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      color: Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Close",style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),),
                        SizedBox(width: 7,),
                        Icon(Icons.close,color: Colors.white,),
                      ],),
                  ),),
              ),
            ),
            ):Container()
          ],
        )
      ),
    );
  }
}