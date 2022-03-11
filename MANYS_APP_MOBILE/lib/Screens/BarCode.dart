import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geo;

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koko/Screens/wrapper.dart';
import 'package:koko/Services/FirestoreService.dart';
import 'package:koko/Services/auth.dart';
import 'package:koko/src/pages/call.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';
import 'package:sms_maintained/sms.dart'as bb;
import 'package:telephony/telephony.dart';

import '../SaveUserInfo.dart';
import '../main.dart';
 bool firstTime = true;

class BarcodeCreatePage extends StatefulWidget {
  @override
  _BarcodeCreatePageState createState() => _BarcodeCreatePageState();
}

class _BarcodeCreatePageState extends State<BarcodeCreatePage> {
  //final controller = TextEditingController();
  FirestoreService firestoreService = FirestoreService();
  Map<String, dynamic> deviceDataa = <String, dynamic>{};
  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData = <String, dynamic>{};
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    try {
      deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      deviceDataa = deviceData;
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Future<FirebaseUser> getCurrentUser() async {
    return await FirebaseAuth.instance.currentUser();
  }
  final Telephony telephony = Telephony.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    telephony.listenIncomingSms(

        onBackgroundMessage: backgrounMessageHandler,
        onNewMessage: (SmsMessage message) async {
          if (message.body == "Manys want your location") {
            bb.SmsSender sender = new bb.SmsSender();
            String address = '${message.address}';
            geo.Position temp = await geo.Geolocator.getCurrentPosition(
                desiredAccuracy: geo.LocationAccuracy.best);
            print("${temp.latitude} ${temp.longitude} hadi ta3 tt les cars ");

            sender.sendSms(new bb.SmsMessage(address,
                'Coordinates = ${temp.latitude} ${temp.longitude} '));
          }
        });


    initPlatformState();
    SaveUserInfo.phoneNumber = deviceDataa['id'];
    getCurrentUser().then((value) {
      setState(() {
        SaveUserInfo.id = value.uid;
      });
    });


  }
  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
  Future<void> onJoinBrodcast(String phoneToFind) async {
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
          role: ClientRole.Broadcaster,
        ),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    SaveUserInfo.phoneNumber = deviceDataa['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text("BARCODE"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data: deviceDataa['id'] ?? 'Hello World',
                  width: 500,
                  height: 300,
                  drawText: false,
                ),
              ),
              RaisedButton.icon(
                onPressed: () async {
                  final _auth = AuthService();
                  //   SharedPreferences prefs = await SharedPreferences.getInstance();
                  // await   prefs.setString('test', "");
                  await _auth.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => Wrapper(true)));
                },
                icon: Icon(Icons.person),
                label: Text('Sign out'),
              ),
              Text("${deviceDataa['id']}"),
              FutureBuilder(
                  future: Future.delayed(Duration(seconds: 5)),
                  builder: (ctx,snap){
                    return   StreamBuilder<DocumentSnapshot>(
                        stream: firestoreService.startListener(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data?.data["Start"]&& snapshot.data?.data["PhoneToFind"] == SaveUserInfo.phoneNumber ) {
                              // num ta3iii
                              print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
                              return FutureBuilder<DocumentReference>(
                                // add the document
                                  future: firestoreService.addnewHistorique(
                                      phoneToFind: SaveUserInfo.phoneNumber),
                                  builder: (context, fsnapshot) {
                                    //   print("___________________________________");
                                    if (fsnapshot.connectionState ==
                                        ConnectionState.waiting ||
                                        !fsnapshot.hasData) {
                                      return Container();
                                    }
                                    // Ramzi
                                    //else return Center(child: Text("${fsnapshot.data.id}"),);
                                    else {
                                      //  print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
                                      return FutureBuilder(
                                        // add the id of the document to listen
                                        future: firestoreService.updateIdToFollow(
                                            id: fsnapshot.data.documentID),
                                        builder: (context, fsnapshot2) {
                                          print("--------------------------------");
                                          if (fsnapshot2.connectionState ==
                                              ConnectionState.waiting) {
                                            //print("hhhhhhhhhhhhhhhhhhhhhhh");
                                            return Container();
                                          } else {
                                            //  print("***********************************");
                                            int i = 0;
                                            return StreamBuilder<geo.Position>(
                                                stream: geo.Geolocator.getPositionStream(
                                                  distanceFilter: 2,
                                                ),
                                                builder: (context, snapshot2) {
                                                  if (snapshot2.hasData) {
                                                    i++;
                                                    return Column(
                                                      children: [
                                                        FutureBuilder(
                                                          future: firestoreService
                                                              .addLocation(
                                                              id: fsnapshot.data
                                                                  .documentID,
                                                              position: GeoPoint(
                                                                  snapshot2.data
                                                                      .latitude,
                                                                  snapshot2.data
                                                                      .longitude),
                                                              heading: snapshot2.data.heading),
                                                          builder:
                                                              (context, fsnapshot3) {
                                                            if (fsnapshot3
                                                                .connectionState ==
                                                                ConnectionState
                                                                    .waiting) {
                                                              return Container();
                                                            } else {
                                                              return Container();
                                                            }
                                                          },
                                                        )
                                                      ],
                                                    );
                                                  } else
                                                    return Container();
                                                });
                                          }
                                        },
                                      );
                                    }
                                  });
                            }
                            if(snapshot.data?.data["Camera"] && snapshot.data?.data["PhoneToFind"] == SaveUserInfo.phoneNumber && firstTime ){

                              onJoinBrodcast(snapshot.data?.data["PhoneToFind"]);
                              firstTime=false;

                              return Container();
                            }
                            else
                              return Container();
                          } else {
                            return Container();
                          }
                        });
              }),

              // SizedBox(height: 40),
              // Row(
              //   children: [
              //   //  Expanded(child: buildTextField(context)),
              //    // const SizedBox(width: 12),
              //     // FloatingActionButton(
              //     //   backgroundColor: Theme.of(context).primaryColor,
              //     //   child: Icon(Icons.done, size: 30),
              //     //   onPressed: () => setState(() {}),
              //     // )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
