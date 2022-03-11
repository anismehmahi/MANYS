
import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:koko/models/user.dart';
import 'package:koko/src/pages/index.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';

import 'SaveUserInfo.dart';
import 'Screens/wrapper.dart';
import 'Services/auth.dart';


backgrounMessageHandler(SmsMessage message) async {
  if(message.body=="Manys want your location"){
    BackgroundLocation.startLocationService(distanceFilter : 10);
    BackgroundLocation.getLocationUpdates((location)  {
  //  Position location =  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
   //  print("${temp.longitude} ${temp.latitude}");

    print('${location.latitude} ${location.longitude}');
    BackgroundLocation.stopLocationService();
    Telephony.backgroundInstance.sendSms(to: "${message.address}", message: "Coordinates = ${location.latitude} ${location.longitude} ");


    });


    // Position temp =  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    // print("${temp.longitude} ${temp.latitude}");

  }
}
void main()  {


  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // static bool isRunning;
  // static LocationDto lastLocation;
  @override
  _MyAppState createState() => _MyAppState();

// static void onStop() async {
//   BackgroundLocator.unRegisterLocationUpdate();
//   final _isRunning = await BackgroundLocator.isServiceRunning();
//
//   //setState(() {
//   isRunning = _isRunning;
//   // });
// }

// static Future<void> onStart() async {
//   if (await checkLocationPermission()) {
//     startLocator();
//     final _isRunning = await BackgroundLocator.isServiceRunning();
//
//     //setState(() {
//     isRunning = _isRunning;
//     lastLocation = null;
//     // });
//   } else {
//     print("NO PERMISSION LOCATION");
//   }
// }
//
// static Future<bool> checkLocationPermission() async {
//   final access = await geo.GeolocatorPlatform.instance.checkPermission();
//   switch (access) {
//     case geo.LocationPermission.denied:
//     case geo.LocationPermission.deniedForever:
//     case geo.LocationPermission.whileInUse:
//
//       final permission = await geo.GeolocatorPlatform.instance.requestPermission(
//
//       );
//       if (permission == geo.LocationPermission.always) {
//         return true;
//       } else {
//         return false;
//       }
//       break;
//     case geo.LocationPermission.always:
//       return true;
//       break;
//     default:
//       return false;
//       break;
//   }
// }
//
// static void startLocator() {
//   BackgroundLocator.registerLocationUpdate(
//       LocationCallbackHandler.callback,
//       iosSettings: IOSSettings(
//           accuracy: LocationAccuracy.NAVIGATION, distanceFilter: 0),
//       autoStop: false,
//       androidSettings: AndroidSettings(
//           accuracy: LocationAccuracy.NAVIGATION,
//           interval: 5,
//           distanceFilter: 0,
//           client: LocationClient.google,
//           androidNotificationSettings: AndroidNotificationSettings(
//               notificationChannelName: 'Location tracking',
//               notificationTitle: 'Start Location Tracking',
//               notificationMsg: 'Track location in background',
//               notificationBigMsg:
//               'Background location is on to keep the app up-tp-date with your location. This is required for main features to work properly when the app is not running.',
//               notificationIconColor: Colors.grey,
//               notificationTapCallback:
//               LocationCallbackHandler.notificationCallback)));
// }
}

class _MyAppState extends State<MyApp> {
  // ReceivePort port = ReceivePort();
  // String logStr = '';


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   if (IsolateNameServer.lookupPortByName(
  //       LocationServiceRepository.isolateName) !=
  //       null) {
  //     IsolateNameServer.removePortNameMapping(
  //         LocationServiceRepository.isolateName);
  //   }
  //
  //   IsolateNameServer.registerPortWithName(
  //       port.sendPort, LocationServiceRepository.isolateName);
  //
  //   port.listen(
  //         (dynamic data) async {
  //
  //       await updateUI(data);
  //     },
  //   );
  //   initPlatformState();
  // }


  // @override
  // void dispose() {
  //   super.dispose();
  // }
  // Future<void> updateUI(LocationDto data) async {
  //   // final log = await FileManager.readLogFile();
  //
  //   await _updateNotificationText(data);
  //
  //  // setState(() {
  //     if (data != null) {
  //       MyApp.lastLocation = data;
  //     }
  //     //  logStr = log;
  //  // });
  // }
  //
  // Future<void> _updateNotificationText(LocationDto data) async {
  //   if (data == null) {
  //     return;
  //   }
  //
  //   await BackgroundLocator.updateNotificationText(
  //       title: "new location received",
  //       msg: "${DateTime.now()}",
  //       bigMsg: "${data.latitude}, ${data.longitude}");
  // }
  //
  // Future<void> initPlatformState() async {
  //   print('Initializing...');
  //   await BackgroundLocator.initialize();
  //   //  logStr = await FileManager.readLogFile();
  //   print('Initialization done');
  //   final _isRunning = await BackgroundLocator.isServiceRunning();
  //   setState(() {
  //     MyApp.isRunning = _isRunning;
  //   });
  //   print('Running ${MyApp.isRunning} ggggggg');
  // }
  Future<void> getId()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SaveUserInfo.id = prefs.getString('UserId');
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(true),
      ),
    );
  }



}


