import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Manys/SaveUserInfo.dart';
import 'package:Manys/Screens/HistoryPolylines.dart';
import 'package:Manys/Services/FirestoreService.dart';
import 'package:latlong/latlong.dart';
import 'package:vrouter/vrouter.dart';

import '../popup.dart';
import '../popup_content.dart';
class History extends StatefulWidget {
  final String barcode;

  const History({Key key, this.barcode}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
   final arg =  ModalRoute.of(context).settings.arguments;

    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width>800 ? MediaQuery.of(context).size.width*0.5:MediaQuery.of(context).size.width*0.8 ,
padding: MediaQuery.of(context).size.width>800 ?EdgeInsets.all(30): EdgeInsets.all(0),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(5)),
//shape: BoxShape.rectangle,
              color: Color(0xff323B58),
            ),

// MBA3D RAH TWALI FUTURE BUILDER QUAND ON TRAVAIL AVEC LA BASE DE DONNE
            child: SizedBox(
              child: ListView(
                //controller: controller,
                shrinkWrap: true,
                children: [

                  Center(
                    child: Stepper(
                        physics: ClampingScrollPhysics(),
                        steps: [
                          Step(
                            state:StepState.complete,
                            title: Text('',style: TextStyle(color: Colors.white),),
                            content:
                            StreamBuilder<QuerySnapshot>(
                              stream: firestoreService.getHistory(

                                  phoneToFind:widget.barcode
                              ),
                              builder: (context, snapshot) {
                                if (snapshot.data?.docs?.isNotEmpty != null &&
                                    snapshot.data.docs.length != 0) {

                                  return SingleChildScrollView(
                                    child: ListView.builder(
                                        physics: ClampingScrollPhysics(),

                                        shrinkWrap: true,
                                        itemCount: snapshot.data.documents.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.zero,
                                            child: Card(
                                              color: Color(0xff323b58),
                                              elevation: 0,
                                              child: ListTile(
                                                title: Row(
                                                  children: [
                                                    Icon(Icons.radio_button_checked_outlined,color: Colors.green,size: 15,),
                                                    SizedBox(width: 8,),
                                                    FittedBox(
                                                      child: Text(
                                                        "${snapshot.data.documents[index]["Time-enre"].toDate().toString().substring(0,19)}",style: TextStyle(color: Colors.white),softWrap: true,),
                                                    ),
                                                  ],
                                                ),
                                                onTap: () async {
                                                  QuerySnapshot querySnapshots =
                                                  await firestoreService.getPolylineSet(
                                                      phoneToFind: widget.barcode,
                                                      id: snapshot.data.documents[index].documentID);
                                                  List<LatLng> points = [];
                                                  querySnapshots.documents.forEach((doc) {
                                                    points.add(LatLng(doc.data()["Position"].latitude, doc.data()["Position"].longitude));
                                                  });
                                                  Navigator.push(
                                                    context,
                                                    PopupLayout(
                                                      top: 30,
                                                      left: 30,
                                                      right: 30,
                                                      bottom: 50,
                                                      child: PopupContent(
                                                        content: Container(
                                                          clipBehavior: Clip.hardEdge,
                                                          decoration: BoxDecoration(
                                                           // borderRadius: BorderRadius.circular(15),
                                                          ),
                                                          child: HistoryPolylines(points: points),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        }),
                                  );
                                }
                                else if(snapshot.connectionState==ConnectionState.waiting) {
                                  return SizedBox(
                                      height: MediaQuery.of(context).size.height*0.6,
                                      //width: MediaQuery.of(context).size.width*0.5,

                                      child: Center(
                                        child:CircularProgressIndicator()));
                                }
                                else{
                                  return SizedBox(
                                      height: MediaQuery.of(context).size.height*0.6,
                                      //width: MediaQuery.of(context).size.width*0.5,

                                      child: Center(
                                        child: FittedBox(
                                          child: Text('THERE IS NO HISTORY YET', style: TextStyle(
                                          color: Colors.white
                                      ),),
                                        ),));
                                }
                              },
                            ),


                          ),
                          Step(
                              state:StepState.complete,

                              title: Text('',style: TextStyle(color: Colors.white)), content: Text('')),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
