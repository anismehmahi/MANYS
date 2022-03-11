// import 'dart:isolate';
// import 'dart:ui';
//
// // import 'package:background_locator/background_locator.dart';
// // import 'package:background_locator/location_dto.dart';
// // import 'package:background_locator/settings/android_settings.dart';
// // import 'package:background_locator/settings/ios_settings.dart';
// // import 'package:background_locator/settings/locator_settings.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flushbar/flushbar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart' as geo;
// import 'package:koko/Authentification/reset.dart';
// import 'package:koko/Services/FirestoreService.dart';
// import 'package:koko/Services/auth.dart';
// import 'package:koko/models/Vehicule.dart';
// import 'package:koko/models/user.dart';
// import '../ADDCAR.dart';
// import '../SupprimerCar.dart';
// import '../popup.dart';
// import '../popup_content.dart';
// import 'PrivacyPolicy.dart';
// import 'feedBack.dart';
// import 'my_drawer_header.dart';
//
//
// class HomePrincipal extends StatefulWidget {
//   @override
//   _HomePrincipalState createState() => _HomePrincipalState();
// }
//
// class _HomePrincipalState extends State<HomePrincipal> {
//   FirestoreService firestoreService = FirestoreService();
//
//   bool _serviceEnabled=true;
//   ReceivePort port = ReceivePort();
//   String logStr = '';
//   bool isRunning;
//   Future getPermission() async {
//
//     geo.LocationPermission permission;
//     _serviceEnabled =  await geo.Geolocator.isLocationServiceEnabled();
//
//     permission = await geo.Geolocator.requestPermission();
//
//
//   }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//
//     getPermission();
//
//
//   }
//   var currentPage = DrawerSections.nothing;
//   User user;
//   @override
//   Widget build(BuildContext context) {
//
//
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//
//         floatingActionButton: FloatingActionButton(
//           onPressed: ()async{
//             await showPopup(context, 'ADD A VEHICLE',ADDCAR());
//
//           },
//           child: Icon( Icons.add),
//           backgroundColor: Colors.amberAccent,
//         ),
//         drawer:  Drawer(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 MyHeaderDrawer(),
//                 MyDrawerList(),
//               ],
//             ),
//           ),
//         ),
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           title: RichText(
//             text: TextSpan(
//                 style: TextStyle(
//                   fontSize: 23,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: "Comfortaa",
//                 ),
//                 children:<TextSpan> [
//                   TextSpan(text:'MANYS ',style: TextStyle(color: Colors.amberAccent)),
//                   TextSpan(text:'Tracker',style: TextStyle(color: Colors.white)),
//
//
//                 ]
//             ),
//
//           ),
//           centerTitle: true,
//
//         ),
//         backgroundColor: Color(0xff1C1C1C),
//         body:   Stack(
//           clipBehavior: Clip.none,
//           overflow: Overflow.visible,
//
//           children: [
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 30,),
//                 Text('Start Tracking',style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30
//                 ),),
//                 SizedBox(height: 100,),
//
//                 Expanded(
//                   child: StreamBuilder<QuerySnapshot>(
//                     stream: firestoreService.getUserCars(),
//                     builder: (context, snapshot) {
//                       if (snapshot.data?.documents?.isNotEmpty!= null && snapshot.data?.documents?.isNotEmpty) {
//                         return ListView.builder(
//                             clipBehavior: Clip.none,
//                             //shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: snapshot.data.documents.length,
//                             itemBuilder: (context, index){
//                               print(snapshot.data?.documents.length);
//                               return Padding(
//
//                                 padding: EdgeInsets.only(right: 30,left: 10),
//                                 child: GestureDetector(
//                                     onLongPress: (){
//                                       showPopup(context, "DELETE VEHICLE",SupprimerCar(index,snapshot.data.documents[index].documentID));
//                                     },
//                                     child:Vehicule(name:snapshot.data.documents[index].data['carName'],
//                                         num: snapshot.data.documents[index].data["phoneNumber"],
//                                         asset:"assets/${snapshot.data.documents[index].data['type']}.png",
//                                         index:snapshot.data.documents[index].documentID,
//                                         barCode:snapshot.data.documents[index].data['barCode']
//                                     )),
//                               );});
//                       }
//                       else if(snapshot.connectionState==ConnectionState.waiting){
//                         return Center (child: CircularProgressIndicator(),);
//                       }
//                       return Padding(
//                         padding: const EdgeInsets.only(top: 70),
//                         child: Center(child: Text('You didn\'t add cars yet',style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                         ),textAlign: TextAlign.center,)),
//                       );
//                     },
//                   )
//
//
//
//
//
//                   ,
//                 ),
//                 //SizedBox(height: 300,),
//
//
//               ],
//             ),
//             !_serviceEnabled? AlertDialog(title: Text('GPS is OFF',textAlign: TextAlign.center,),content: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(Icons.warning,size: 40,color: Colors.red,),
//                   SizedBox(height: 10,),
//                   IconButton(icon: Icon(Icons.done), onPressed: (){
//                     setState(() {
//                       _serviceEnabled=true;
//                     });
//                   })
//                 ],
//               ),
//             )): Container(),
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   Widget MyDrawerList() {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       color: Color(0xff353535),
//       padding: EdgeInsets.only(
//         top: 15,
//       ),
//       child: Column(
//         // shows the list of menu drawer
//         children: [
//
//
//           menuItem(1, "Edit User Photo", Icons.photo,
//               currentPage == DrawerSections.photo ? true : false),
//           menuItem(2, "Edit Password", Icons.security,
//               currentPage == DrawerSections.password ? true : false),
//
//           menuItem(3, "Edit phone number", Icons.phone_android,
//               currentPage == DrawerSections.number ? true : false),
//           menuItem(4, "Logout", Icons.logout,
//               currentPage == DrawerSections.logout ? true : false),
//           Divider(),
//           menuItem(5, "Privacy policy", Icons.privacy_tip_outlined,
//               currentPage == DrawerSections.privacy_policy ? true : false),
//           menuItem(6, "Send feedback", Icons.feedback_outlined,
//               currentPage == DrawerSections.send_feedback ? true : false),
//         ],
//       ),
//     );
//   }
//
//   Widget menuItem(int id, String title, IconData icon, bool selected) {
//     return InkWell(
//
//       onTap: () {
//         Navigator.pop(context);
//         setState(() {
//           if (id == 1) {
//             currentPage = DrawerSections.photo;
//           } else if (id == 2) {
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => ResetScreen()));
//           } else if (id == 3) {
//             currentPage = DrawerSections.number;
//           } else if (id == 4) {
//             final _auth = AuthService();
//             _auth.signOut();
//             currentPage = DrawerSections.logout;
//           } else if (id == 5) {
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => PrivacyPolicy()));
//           } else if (id == 6) {
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => FeedBack()));
//           }
//           // } else if (id == 7) {
//           //   currentPage = DrawerSections.privacy_policy;
//           // } else if (id == 8) {
//           //   currentPage = DrawerSections.send_feedback;
//           // }
//         });
//       },
//       child: Padding(
//         padding: EdgeInsets.all(15.0),
//         child: Row(
//           children: [
//             Expanded(
//               child: Icon(
//                 icon,
//                 size: 20,
//                 color: Colors.white,
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }
// enum DrawerSections {
//   nothing,
//   photo,
//   password,
//   number,
//   logout,
//   privacy_policy,
//   send_feedback,
// }
//
// showPopup(BuildContext context, String title,Widget child,
//     {BuildContext popupContext}) {
//   Navigator.push(
//     context,
//     PopupLayout(
//       top: 30,
//       left: 30,
//       right: 30,
//       bottom: 50,
//       child: PopupContent(
//         content: Container(
//           clipBehavior: Clip.hardEdge,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: child,
//         ),
//       ),
//     ),
//   );
// }
//
//
//
import 'dart:ffi';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:koko/Authentification/reset.dart';
import 'package:koko/SaveUserInfo.dart';
import 'package:koko/Screens/Home.dart';
import 'package:koko/Services/FirestoreService.dart';
import 'package:koko/Services/auth.dart';
import 'package:koko/models/Vehicule.dart';
import 'package:koko/models/user.dart';
import '../ADDCAR.dart';
import '../SupprimerCar.dart';
import '../popup.dart';
import '../popup_content.dart';
import 'PrivacyPolicy.dart';
import 'feedBack.dart';
import 'my_drawer_header.dart';

class HomePrincipal extends StatefulWidget {
  @override
  _HomePrincipalState createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  FirestoreService firestoreService = FirestoreService();

  bool _serviceEnabled = true;
  ReceivePort port = ReceivePort();
  String logStr = '';
  String username = '';
  String getUserName() {
    String name;
    FirestoreService firestoreService = FirestoreService();
    Firestore db = Firestore.instance;

    db
        .collection('Users')
        .document(firestoreService.getId())
        .get()
        .then((value) {
      username = value.data['UserName'].toString();
    });

    return name;
  }

  Future getPermission() async {
    geo.LocationPermission permission;
    _serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();

    permission = await geo.Geolocator.requestPermission();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getPermission();
  }

  var currentPage = DrawerSections.nothing;
  User user;
  bool firstTime = true;
  String selectedCar = '';
  String carName = '', PhoneNumber = '', barCode = '', asset = '';
  String selectedID = '';
  Random rnd = new Random();
  @override
  Widget build(BuildContext context) {
    if (firstTime) {
      FirestoreService firestoreService = FirestoreService();
      Firestore db = Firestore.instance;

      db.collection('Users').document(SaveUserInfo.id).get().then((value) {
        setState(() {
          username = value.data['UserName'].toString();
        });
      });
    }
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showPopup(context, 'ADD A VEHICLE', ADDCAR());
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 40,
          ),
          backgroundColor: Colors.amberAccent,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [
            Icons.arrow_forward,
            Icons.brightness_4,
          ],
          iconSize: 0,
          activeIndex: 0,
          backgroundColor: Color(0xffFFFFCF3D),
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
          leftCornerRadius: 0,
          height: 30,
          rightCornerRadius: 0,
          onTap: (indx) {},
          //  onTap: (index) => setState(() => _bottomNavIndex = index),
          //other params
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //MyHeaderDrawer(username),
                Container(
                  color: Color(0xff1C1C1C),
                  width: double.infinity,
                  height: 200,
                  padding: EdgeInsets.only(top: .0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        foregroundImage: AssetImage("assets/user.png"),
                        backgroundColor: Colors.transparent,
                        radius: 60,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        username == null ? '' : username.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                MyDrawerList(),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: RichText(
            text: TextSpan(
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Comfortaa",
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'MANYS ',
                      style: TextStyle(color: Colors.amberAccent)),
                  TextSpan(
                      text: 'Tracker', style: TextStyle(color: Colors.white)),
                ]),
          ),
          centerTitle: true,
        ),
        backgroundColor: Color(0xff1C1C1C),
        body: Stack(
          clipBehavior: Clip.none,
          overflow: Overflow.visible,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: firestoreService.getUserCars(),
                builder: (context, snapshot) {
                  if (snapshot.data?.documents?.isNotEmpty != null &&
                      snapshot.data?.documents?.isNotEmpty) {
                    //  setState(() {
                    if (firstTime) {
                      selectedCar =
                          "${snapshot.data.documents.first.data['type']}-HORIZONTAL.png";
                      carName = snapshot.data.documents.first.data['carName'];
                      PhoneNumber =
                          snapshot.data.documents.first.data['phoneNumber'];
                      selectedID = snapshot.data.documents.first.documentID;
                      barCode = snapshot.data.documents.first.data['barCode'];
                      asset =
                          "assets/${snapshot.data.documents.first.data['type']}.png";
                      firstTime = false;
                    }
                    //   });
                    double c;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Column(
                              children: [
                                Hero(
                                  tag: '1',
                                  child: Container(
                                    width: 400,
                                  height: 180,
                                    child: Center(
                                      child: Image.asset(
                                        "assets/$selectedCar",
                                        width: 400,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Center(
                                  child: Text(
                                    carName == null
                                        ? ''
                                        : carName.toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.019,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffFFFFCF3D),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(22)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Number :",
                                                style: TextStyle(
                                                    color: Color(0xffFFFFCF3D),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 19),
                                              ),
                                              Text(
                                                PhoneNumber == null
                                                    ? '0999'
                                                    : PhoneNumber,
                                                style: TextStyle(
                                                    color: Color(0xffFFFFCF3D),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 19),
                                              )
                                            ]),
                                        SizedBox(height: 14),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Battery  :",
                                                style: TextStyle(
                                                    color: Color(0xffFFFFCF3D),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 19),
                                              ),
                                              //Text("|||||||||||", style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w500, fontSize: 19),),
                                              Container(
                                                height: 27,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30)),
                                                  color: Colors.grey,
                                                  gradient: new LinearGradient(
                                                      stops: [
                                                        c = rnd.nextDouble() *
                                                            0.7,
                                                        0.02
                                                      ],
                                                      colors: [
                                                        c <= 0.2
                                                            ? Colors.red
                                                            : Colors.green[900],
                                                        Colors.white
                                                      ]),
                                                  // border: Border(
                                                  //   left: BorderSide(
                                                  //       color: Colors.green[900], width: rnd.nextDouble()*110),
                                                  //   right: BorderSide(),
                                                  //   top: BorderSide(),
                                                  //   bottom: BorderSide(),
                                                  //
                                                  // ),
                                                ),
                                              )
                                            ]),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        borderRadius: BorderRadius.circular(30),
                                        onTap: () {
                                          // la fonction ta3 select
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      Home(infoCar: {
                                                        "name": carName,
                                                        "num": PhoneNumber,
                                                        "asset": asset,
                                                        "barCode": barCode,
                                                      }, index: '1')));
                                        },
                                        child: Ink(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Color(0xffFFFFCF3D),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        borderRadius: BorderRadius.circular(30),
                                        onTap: () async {
                                          //     // delete car
                                          showPopup(context, "DELETE VEHICLE",
                                              SupprimerCar(1, selectedID));
                                        },
                                        child: Ink(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.redAccent,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // Text("4G",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
                                              //SizedBox(width: 7,),
                                              Icon(
                                                Icons.delete,
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ])
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (_, i) => Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Row(
                                        children: [
                                          // SizedBox(width: 15),
                                          InkWell(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                            onTap: () {
                                              //ADD YOUR COMMENT HERE
                                              setState(() {
                                                selectedCar =
                                                    "${snapshot.data.documents[i].data['type']}-HORIZONTAL.png";
                                                carName = snapshot
                                                    .data
                                                    .documents[i]
                                                    .data['carName'];
                                                PhoneNumber = snapshot
                                                    .data
                                                    .documents[i]
                                                    .data['phoneNumber'];
                                                selectedID = snapshot.data
                                                    .documents[i].documentID;
                                                barCode = snapshot
                                                    .data
                                                    .documents[i]
                                                    .data['barCode'];
                                                asset =
                                                    "assets/${snapshot.data.documents[i].data['type']}.png";
                                              });
                                            },
                                            child: Container(
                                              height: 200,
                                              width: 160,
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              decoration: BoxDecoration(
                                                //color: Colors.blueGrey,
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                                border: Border.all(
                                                    color: Color(0xffFFFFCF3D),
                                                    width: (selectedID ==
                                                            snapshot
                                                                .data
                                                                .documents[i]
                                                                .documentID)
                                                        ? 1.5
                                                        : 0.2),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                    bottom: 5,
                                                    top: 4),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Center(
                                                      child: Image.asset(
                                                        "assets/${snapshot.data.documents[i].data['type']}-HORIZONTAL.png",
                                                        // height:100 ,
                                                        // width:100,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot.data.documents[i]
                                                          .data['carName']
                                                          .toString()
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                        color: (selectedID ==
                                                                snapshot
                                                                    .data
                                                                    .documents[
                                                                        i]
                                                                    .documentID)
                                                            ? Colors.white
                                                            : Colors.white54,
                                                        fontSize: 15,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Container(
                                                      height: 1,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3),
                                                          color: (selectedID ==
                                                                  snapshot
                                                                      .data
                                                                      .documents[
                                                                          i]
                                                                      .documentID)
                                                              ? Color(
                                                                  0xffFFFFCF3D)
                                                              : Colors
                                                                  .transparent),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                          ),
                          // SizedBox(height: 50,),
                        ],
                      ),
                    );
                  } else if (snapshot.data?.documents?.isEmpty != null &&
                      snapshot.data?.documents?.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Center(
                          child: Text(
                        'You didn\'t add any vehicle yet !'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      )),
                    );
                  } else
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xffFFFFCF3D),
                      ),
                    );
                },
              ),
            ),
            !_serviceEnabled
                ? AlertDialog(
                    title: Text(
                      'GPS is OFF',
                      textAlign: TextAlign.center,
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.warning,
                            size: 40,
                            color: Colors.red,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          IconButton(
                              icon: Icon(Icons.done),
                              onPressed: () {
                                setState(() {
                                  _serviceEnabled = true;
                                });
                              })
                        ],
                      ),
                    ))
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Color(0xff353535),
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Edit User Photo", Icons.photo,
              currentPage == DrawerSections.photo ? true : false),
          menuItem(2, "Edit Password", Icons.security,
              currentPage == DrawerSections.password ? true : false),
          menuItem(3, "Edit phone number", Icons.phone_android,
              currentPage == DrawerSections.number ? true : false),
          menuItem(4, "Logout", Icons.logout,
              currentPage == DrawerSections.logout ? true : false),
          Divider(),
          menuItem(5, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(6, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          if (id == 1) {
            currentPage = DrawerSections.photo;
          } else if (id == 2) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ResetScreen()));
          } else if (id == 3) {
            currentPage = DrawerSections.number;
          } else if (id == 4) {
            final _auth = AuthService();
            _auth.signOut();
            currentPage = DrawerSections.logout;
          } else if (id == 5) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => PrivacyPolicy()));
          } else if (id == 6) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FeedBack()));
          }
          // } else if (id == 7) {
          //   currentPage = DrawerSections.privacy_policy;
          // } else if (id == 8) {
          //   currentPage = DrawerSections.send_feedback;
          // }
        });
      },
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum DrawerSections {
  nothing,
  photo,
  password,
  number,
  logout,
  privacy_policy,
  send_feedback,
}

showPopup(BuildContext context, String title, Widget child,
    {BuildContext popupContext}) {
  Navigator.push(
    context,
    PopupLayout(
      top: 30,
      left: title == 'DELETE VEHICLE' ? 5 : 20,
      right: title == 'DELETE VEHICLE' ? 5 : 20,
      bottom: 50,
      child: PopupContent(
        content: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: child,
        ),
      ),
    ),
  );
}
