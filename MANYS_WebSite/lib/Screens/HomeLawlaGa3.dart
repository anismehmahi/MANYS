import 'dart:isolate';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:Manys/SaveUserInfo.dart';
import 'package:Manys/Services/FirestoreService.dart';
import 'package:Manys/Services/auth.dart';
import 'package:ripple_animation/ripple_animation.dart';
import 'package:vrouter/vrouter.dart';

import '../popup.dart';
import '../popup_content.dart';
import 'History.dart';
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
  bool firstTimee=true;
  String username='';

  bool isRunning;
  SwiperController conroller = SwiperController();

  Future<String> getUserName() async {
    FirestoreService firestoreService = FirestoreService();
    FirebaseFirestore db = FirebaseFirestore.instance;

    DocumentSnapshot qr =
        await db.collection('Users').doc(firestoreService.getId()).get();

    SaveUserInfo.name = qr.data()['UserName'].toString();
  }

  var currentPage = DrawerSections.nothing;
  bool firstTime = true;
  Key _key;

  // User user;
  // ignore: deprecated_member_use

  int CurrentIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final uid = context.vRouter.pathParameters['uid'];
    SaveUserInfo.id = uid;

 if(firstTimee){
   FirestoreService firestoreService = FirestoreService();
   FirebaseFirestore db = FirebaseFirestore.instance;


   db.collection('Users').doc(firestoreService.getId()).get().then((value) {
     setState(() {
       SaveUserInfo.name = value.data()['UserName'].toString();
       username= SaveUserInfo.name;

     });
   });
   firstTimee=false;
 }



    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
             //   MyHeaderDrawer(),
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
                SizedBox(height: 20,),
                Text(  username==null?'':username.toUpperCase(),
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
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                  height: 30,
                ),
                Flexible(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: firestoreService.getUserCars(),
                    builder: (context, snapshot) {
                         //print(snapshot.data);
                      if (snapshot.data?.docs?.isNotEmpty != null &&
                          snapshot.data.docs.length != 0) {
                        if(firstTime){
                          if(snapshot.data.docs.length<=4 &&snapshot.data.docs.length >2 ){
                                CurrentIndex=1;

                          }
                          else if(snapshot.data.docs.length>=5){
                           // WidgetsBinding.instance.addPostFrameCallback((_){
                              CurrentIndex=2;

                              // Add Your Code here.

                           // });
                          }
                          firstTime=false;
                        }

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                  bottom: 15,
                                  left: 0,
                                  right: 0,
                                  top: 20,
                                  child: Center(
                                    child: RippleAnimation(
                                        repeat: true,
                                        key: _key,
                                        color: Color.fromRGBO(255, 40, 25, 1.0),
                                        minRadius: 55,
                                        ripplesCount: 6,
                                        child: Container()),
                                  ),
                                ),
                                new Image.network(
                                  "assets/assets/${snapshot.data.docs[CurrentIndex].data()['type'].toString().toUpperCase()}-HORIZONTAL.png",
                                  height: 300,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: () async {
                                    FirestoreService firestoreService =
                                        FirestoreService();

                                    context.vRouter.pushNamed('map',
                                        pathParameters: {
                                          'codeBar': snapshot
                                              .data.docs[CurrentIndex]
                                              .data()['barCode']
                                        });


                                    await firestoreService.startTrackingCar(
                                      phoneToFind: snapshot
                                          .data.docs[CurrentIndex]
                                          .data()['barCode'],
                                    );
                                  },
                                  child: Ink(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width >
                                            800
                                        ? MediaQuery.of(context).size.width *
                                        0.15
                                        : MediaQuery.of(context).size.width *
                                            0.35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.amberAccent,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "TRACK",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Icon(
                                          Icons.wifi,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: () async {
                                    // await showPopup(context, "",History(barcode : widget.barCode),widget.barCode);
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
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: History(
                                                barcode: snapshot
                                                    .data.docs[CurrentIndex]
                                                    .data()['barCode']),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Ink(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width >
                                            800
                                        ? MediaQuery.of(context).size.width *
                                            0.15
                                        : MediaQuery.of(context).size.width *
                                            0.35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.amberAccent,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FittedBox(
                                            child: Text(
                                          "HISTORY",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Icon(
                                          Icons.history,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.only(top: 20,left: 5,right: 5),
                                width: MediaQuery.of(context).size.width > 800
                                    ? MediaQuery.of(context).size.width * 0.7
                                    : MediaQuery.of(context).size.width * 0.95,
                                child: new Swiper(
                                  index:CurrentIndex ,
                                  controller: conroller,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 5, right: 5),
                                      child: Stack(

                                        children: [
                                          index == CurrentIndex
                                              ? Positioned.fill(
                                            top:MediaQuery.of(context).size.width <= 800 ? 30: 10,
                                                  child: Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Icon(
                                                        Icons
                                                            .arrow_drop_down_outlined,
                                                        color: Colors.amber,
                                                        size: 50,
                                                      )))
                                              : Container(
                                                  height: 10,
                                                ),
                                          Positioned.fill(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                   // color: Colors.red,
                                                    child: new Image.network(
                                                      "assets/assets/${snapshot.data.docs[index].data()['type'].toString().toLowerCase()}.png",
                                                      height:
                                                          index == CurrentIndex
                                                              ? 200
                                                              : 120,
                                                      width: index == CurrentIndex
                                                          ? 200
                                                          : 120,
                                                      fit: BoxFit.scaleDown,
                                                    ),
                                                  ),
                                                  Positioned.fill(
                                                    bottom: index != CurrentIndex ?0:snapshot.data.docs[index].data()['type'].toString().toLowerCase() != 'moto'? 15:5,
                                                      child: Align(
                                                        alignment:Alignment.bottomCenter,
                                                          child: Text(
                                                            snapshot.data.docs[index].data()['carName'].toString().toUpperCase(),
                                                    style: TextStyle(
                                                        color:index == CurrentIndex ? Colors.white: Colors.white70,
                                                    fontSize: index == CurrentIndex ?17: 13
                                                    ),
                                                            textAlign: TextAlign.center,
                                                  )))
                                                ],
                                              ),
                                            ),
                                          ),

                                          //Text(snapshot.data.docs[index].data()['type'].toString().toLowerCase()),
                                        ],
                                      ),
                                    );
                                  },
                                  loop: false,
                                  itemCount: snapshot.data.docs.length,
                                  viewportFraction:
                                      MediaQuery.of(context).size.width > 800
                                          ? 0.2
                                          : 0.3,
                                  scale:MediaQuery.of(context).size.width <= 800? 0.2:0.8,
                                  onIndexChanged: (newIndex) {
                                    setState(() {
                                      CurrentIndex = newIndex;
                                    });
                                  },
                                  onTap: (newPage) {
                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                      CurrentIndex = newPage;

                                    });


                                    Future.delayed(Duration(milliseconds: 100),(){
                                      conroller.move(newPage);
                                    });

                                  },
                                  // itemHeight: 90,
                                  // itemWidth: 90,
                                ),
                              ),
                            ),
                          ],
                        );


                      }
                      else if(snapshot.data?.documents?.isEmpty!= null && snapshot.data?.documents?.isEmpty){
                        return Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Center(child: Text('You didn\'t add any vehicle yet !'.toUpperCase(),style: TextStyle(
                            color: Colors.white,
                            fontSize:18,
                          ),textAlign: TextAlign.center,)),
                        );
                      }
                      else                     return Center (child: CircularProgressIndicator(color: Color(0xffFFFFCF3D),),);

                    },
                  ),
                ),
                //SizedBox(height: 300,),
              ],
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
        setState(() {
          if (id == 1) {
            currentPage = DrawerSections.photo;
          } else if (id == 2) {
            context.vRouter.pushNamed('reset');

            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => ResetScreen()));
          } else if (id == 3) {
            currentPage = DrawerSections.number;
          } else if (id == 4) {
            // print( context.vRouter.previousUrl);
            context.vRouter.pushReplacementNamed('start');
            //Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Start()));
            final _auth = AuthService();
            _auth.signOut();
            currentPage = DrawerSections.logout;
          } else if (id == 5) {
            context.vRouter.pushNamed('privacy');
            // Navigator.of(context).pushNamed('/Privacy');
          } else if (id == 6) {
            context.vRouter.pushNamed('feedback');

            //Navigator.of(context).pushNamed("/FeedBack");

          }
          // } else if (id == 7) {
          //   currentPage = DrawerSections.privacy_policy;
          // } else if (id == 8) {
          //   currentPage = DrawerSections.send_feedback;
          // }
        });
        Navigator.pop(context);
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

class CustomScrollPhysics extends ScrollPhysics {
  final double itemDimension;

  const CustomScrollPhysics(
      {@required this.itemDimension, ScrollPhysics parent})
      : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics(
        itemDimension: itemDimension, parent: buildParent(ancestor));
  }

  double _getPage(ScrollMetrics position, double portion) {
    // <--
    return (position.pixels + portion) / itemDimension;
    // -->
  }

  double _getPixels(double page, double portion) {
    // <--
    return (page * itemDimension) - portion;
    // -->
  }

  double _getTargetPixels(
    ScrollMetrics position,
    Tolerance tolerance,
    double velocity,
    double portion,
  ) {
    // <--
    double page = _getPage(position, portion);
    // -->
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    // <--
    return _getPixels(page.roundToDouble(), portion);
    // -->
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }

    final Tolerance tolerance = this.tolerance;
    // <--
    final portion = (position.extentInside - itemDimension) / 2;
    final double target =
        _getTargetPixels(position, tolerance, velocity, portion);
    // -->
    if (target != position.pixels) {
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
