import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Manys/Screens/webMap.dart';
import 'package:Manys/Services/FirestoreService.dart';
import 'package:ripple_animation/ripple_animation.dart';

import 'package:latlong/latlong.dart';

import '../main.dart';
import 'HistoryPolylines.dart';
import 'SecondPage.dart';
class Home extends StatefulWidget {
  bool showsnackbar=false;
  Map<String,String> infoCar ;
  String index;
  Home({Map<String, String> infoCar, String index}){
    this.infoCar=infoCar;
    this.index=index;
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textController= TextEditingController();
  Key _key;
  @override
  void initState() {
    super.initState();

  }



  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //smsStream?.cancel();
  }
  FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,

        ),
        key: _scaffoldKey,
        backgroundColor: Color(0xff1C1C1C),

        body: SafeArea(
          child: Homemini(),
        ));
  }

  Widget Homemini(){
    return Stack(

        children:[

          SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              children: [
                SizedBox(height: 90,),
                Stack(
                  // overflow: Overflow.clip,
                    children:[
                      Positioned(
                        bottom:15,
                        left: 0,
                        right: 0,
                        top:20,
                        child: Center(

                          child: RippleAnimation(
                              repeat: true,
                              key: _key,
                              color:Color.fromRGBO(255, 40, 25, 1.0),
                              minRadius: 55,
                              ripplesCount: 6,
                              child: Container()
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/2.7,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Hero(
                              tag: "${widget.index}",
                              child: Image(image: AssetImage(widget.infoCar['asset']),fit: BoxFit.contain)),


                        ),
                      ),

                    ]

                ),
                SizedBox(height: 30,),
                Text('LOCALISER VOTRE VEHICULE : ', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 13,
                    color: Colors.white
                ),),

                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [


                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () async{

                        FirestoreService firestoreService = FirestoreService();

                        await firestoreService.startTrackingCar(
                          phoneToFind: widget.infoCar["barCode"],
                        );

                      },                    child:  Ink(
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.amberAccent,
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("4G",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
                          SizedBox(width: 7,),
                          Icon(Icons.wifi,color: Colors.black,),
                        ],),
                    ),),


                  ],),
                SizedBox(height: 20,),



              ],
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.1,

              maxChildSize: 0.7,
              minChildSize: 0.1,
              builder: (context,controller){
                return    Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25) ),
                    color: Color(0xff323B58),
                  ),

                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      controller: controller,
                      shrinkWrap: true,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10,bottom: 13),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topLeft:Radius.circular(20), topRight:Radius.circular(10),bottomRight: Radius.circular(10)  ),
                                ),
                                height: 4,
                                width: 50,
//alignment: Alignment.center,
                              ),
                              Text('Historique',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,wordSpacing: 10),),

                            ],
                          ),
                        ),
                        Stepper(
                            physics: ClampingScrollPhysics(),
                            steps: [
                              Step(
                                state:StepState.complete,
                                title: Text('',style: TextStyle(color: Colors.white),),
                                content:
                                StreamBuilder<QuerySnapshot>(
                                  stream: firestoreService.getHistory(

                                      phoneToFind: widget.infoCar["barCode"]
                                  ),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return SingleChildScrollView(
                                        child: ListView.builder(
                                            physics: ClampingScrollPhysics(),

                                            shrinkWrap: true,
                                            itemCount: snapshot.data.documents.length,
                                            itemBuilder: (context, index) {
                                              return Ink(
                                                child: ListTile(
                                                  title: Text(
                                                      "${snapshot.data.documents[index]["Time-enre"].toDate()}",style: TextStyle(color: Colors.white),),
                                                  onTap: () async {
                                                    QuerySnapshot querySnapshots =
                                                    await firestoreService.getPolylineSet(
                                                        phoneToFind: widget.infoCar["barCode"],
                                                        id: snapshot.data.documents[index].documentID);
                                                    List<LatLng> points = [];
                                                    querySnapshots.documents.forEach((doc) {
                                                      print("the time ${doc.data()["time"]}");
                                                      print("${doc.data()["Position"].latitude}");
                                                      points.add(LatLng(doc.data()["Position"].latitude, doc.data()["Position"].longitude));
                                                      print("${doc.data()["Position"].longitude}");
                                                    });
                                                    // pass the points to the
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HistoryPolylines(points: points,)));
                                                  },
                                                ),
                                              );
                                            }),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),

                              ),
                              Step(
                                  state:StepState.complete,

                                  title: Text('',style: TextStyle(color: Colors.white)), content: Text('')),
                            ])
                      ],
                    ),
                  ),
                );
              }),
        ]
    );
  }
}


