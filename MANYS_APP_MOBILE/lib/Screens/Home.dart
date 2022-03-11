import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:koko/Services/FirestoreService.dart';
import 'package:koko/Services/SMS.dart';
import 'package:koko/src/pages/call.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sms_maintained/sms.dart' as bb;
import 'package:telephony/telephony.dart';
import 'package:ripple_animation/ripple_animation.dart';

import '../main.dart';
import 'HistoryPolylines.dart';
import 'SecondPage.dart';
class Home extends StatefulWidget {
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
// static final  _formKey = GlobalKey<FormState>();


  //MaskFilter _blur;
  TextEditingController textController= TextEditingController();
  Key _key;
  StreamSubscription<bb.SmsMessage>  smsStream;
  @override
  void initState() {
    super.initState();

  }


  bb.SmsReceiver receiver = new bb.SmsReceiver();

  getCurrentLocation()async{
    Position temp =  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    return temp;
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    smsStream?.cancel();
  }
  FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    // Scaffold.of(context).showSnackBar(SnackBar(content: Text("dwddd"), ));
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
  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
  Future<void> onJoinAudience(String phoneToFind) async {
    // update input validation

    // await for camera and mic permissions before pushing video page
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    // push video page with given channel name
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(
          channelName:phoneToFind,
          role: ClientRole.Audience,
        ),
      ),
    );

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

                              tag: '1',
                              child: Image(image: AssetImage(widget.infoCar['asset']),fit: BoxFit.contain)),


                        ),
                      ),

                    ]

                ),
                SizedBox(height: 30,),
                Text('LOCATE YOUR VEHICLE USING : ', style: TextStyle(
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


                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> SecondPage(phoneToFind: widget.infoCar["barCode"],asset:widget.infoCar["asset"])
                        ));

                      },
                      child:  Ink(
                        height: 60,
                        width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff323B58),
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         // Text("4G",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
                          //SizedBox(width: 7,),
                          Icon(Icons.wifi,color: Colors.white,size: 30,),
                        ],),
                    ),),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () async{
                        print(widget.infoCar["num"]);
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SendSms(widget.infoCar["num"])));

                      },                    child:  Ink(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff323B58),
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text("SMS",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
                          // SizedBox(width: 7,),
                          Icon(Icons.sms_rounded,color: Colors.white,size: 30,),
                        ],),
                    ),),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () async{
                        FirestoreService firebaseInstance = FirestoreService();
                        await firestoreService.OpenCamera(phoneToFind: widget.infoCar["barCode"]);
                        onJoinAudience(widget.infoCar["barCode"]);
                        // print(widget.infoCar["num"]);
                        // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SendSms(widget.infoCar["num"])));

                      },                    child:  Ink(
                       height: 60,
                       width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff323B58),
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text("CAMERA",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
                          // SizedBox(width: 7,),
                          Icon(Icons.camera_alt,color: Colors.white,size: 30,),
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
//shape: BoxShape.rectangle,
                    color: Color(0xff323b58),
                  ),

// MBA3D RAH TWALI FUTURE BUILDER QUAND ON TRAVAIL AVEC LA BASE DE DONNE
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      controller: controller,
                      shrinkWrap: true,
                      children: [
                        Center(
                          child: Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10,bottom: 13),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topLeft:Radius.circular(20), topRight:Radius.circular(10),bottomRight: Radius.circular(10)  ),
                                ),
                                height: 4,
                                width: MediaQuery.of(context).size.width*0.3,
//alignment: Alignment.center,
                              ),
                              Text('History',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,letterSpacing: 3),),

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
                                              return Card(
                                                color: Color(0xff323b58),
                                                elevation: 0,
                                                child: ListTile(
                                                  title: Row(
                                                    children: [
                                                      Icon(Icons.radio_button_checked_outlined,color: Colors.green,size: 15,),
                                                      SizedBox(width: 15,),
                                                      Text(
                                                          "${snapshot.data.documents[index]["Time-enre"].toDate().toString().substring(0,19)}",style: TextStyle(color: Colors.white),),
                                                    ],
                                                  ),
                                                  onTap: () async {
                                                    QuerySnapshot querySnapshots =
                                                    await firestoreService.getPolylineSet(
                                                        phoneToFind: widget.infoCar["barCode"],
                                                        id: snapshot.data.documents[index].documentID);
                                                    List<LatLng> points = [];
                                                    querySnapshots.documents.forEach((doc) {
                                                      // print("the time ${doc.data["time"]}");
                                                      // print("${doc.data["Position"].latitude}");
                                                      points.add(LatLng(doc.data["Position"].latitude, doc.data["Position"].longitude));
                                                     // print("${doc.data["Position"].longitude}");
                                                    });
                                                    // pass the points to the
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HistoryPolylines(points: points,)));
                                                  },
                                                ),
                                              );
                                            }),
                                      );
                                    } else {
                                      return Text('THERE IS NO HISTORY YET', style: TextStyle(color: Colors.white),);
                                    }
                                  },
                                ),
                              //   Column(
                              //   children: [
                              //     ListTile(title: Text("12-12-2021 13:26",style: TextStyle(fontSize: 15,color: Colors.white),),),
                              //     ListTile(title: Text("13-12-2021 21:00",style:TextStyle(fontSize: 15,color: Colors.white),),),
                              //     ListTile(title: Text("17-12-2021 14:44",style: TextStyle(fontSize: 15,color: Colors.white),),),
                              //     ListTile(title: Text("20-12-2021 8:12",style: TextStyle(fontSize: 15,color: Colors.white),),),
                              //     ListTile(title: Text("22-12-2021 15:20",style:TextStyle(fontSize: 15,color: Colors.white),),),
                              //
                              //   ],
                              // ),

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


