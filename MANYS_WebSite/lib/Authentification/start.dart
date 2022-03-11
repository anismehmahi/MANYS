
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Manys/Authentification/signin.dart';
import 'package:Manys/Routes.dart';
import 'package:vrouter/vrouter.dart';
import 'package:web_navbar/web_navbar.dart';

class Start extends StatefulWidget {
  // Function toggleStart;
  // Start({this.toggleStart});
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  double radius = 50;
  double svg = 33;
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      appBar:  WebNavbar(
        navColor: Colors.black,
        hamburgerColor: Colors.white,
        pathImage: "assets/logoJaune.png",
        myButtons: [
          TextButton(onPressed: (){}, child: Text('Download',style: TextStyle(color:  Color.fromRGBO(179,179,179,1)),)),
          TextButton(onPressed: (){}, child: Text('FAQ',style: TextStyle(color:  Color.fromRGBO(179,179,179,1)),)),
          TextButton(onPressed: (){}, child: Text('CONTACT',style: TextStyle(color:  Color.fromRGBO(179,179,179,1)),)),

        ],
        textNavbar: Text(
          "",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        // width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Image(
              image: AssetImage("assets/logoJaune.png"),
              width: 160,
              height: 160,
            ),
            SizedBox(
              height: 40,
            ),
            Text('MANYS Tracker',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: 30,
            ),
            Text('Track Your Car Wherever It Is',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(
              height: 40,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () async {
                  context.vRouter.pushNamed('login');
              },
              child: Ink(
                height: 45,
                width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.amberAccent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "GET STARTED NOW",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 250,
            ),
            Text("MANYS offers everything you need",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            Text("Locate your car using GPS.",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(color: Color.fromRGBO(207, 216, 220, 1),fontSize: 18, )),
            SizedBox(height: 120,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: radius,
                      backgroundColor: Color.fromRGBO(3, 24, 19, 1),
                      child: SvgPicture.network(
                        "assets/assets/edit.svg",
                        width: svg,
                        height: svg,
                        //semanticsLabel: 'Acme Logo'
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "Edit freely",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: radius,
                      backgroundColor: Color.fromRGBO(0, 23, 26, 1),
                      child: SvgPicture.network(
                        "assets/assets/globe.svg",
                        width: svg,
                        height: svg,
                        //semanticsLabel: 'Acme Logo'
                      ),
                    ),
                    SizedBox(height: 8,),

                    Text(
                      "Available globally",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: radius,
                      backgroundColor: Color.fromRGBO(26, 2, 7, 1),
                      child: SvgPicture.network(
                        "assets/assets/layout.svg",
                        width: svg,
                        height: svg,
                        //semanticsLabel: 'Acme Logo'
                      ),
                    ),
                    SizedBox(height: 8,),

                    Text(
                      "Beautiful layouts",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: radius,
                      backgroundColor: Color.fromRGBO(0, 23, 12, 1),
                      child: SvgPicture.network(
                        "assets/assets/monitor.svg",

                        width: svg,
                        height: svg,
                        //semanticsLabel: 'Acme Logo'
                      ),
                    ),
                    SizedBox(height: 8,),

                    Text(
                      "Unlimited devices",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
            ),

            Flex(
              mainAxisAlignment: MainAxisAlignment.center,

              direction: isScreenWide ? Axis.horizontal : Axis.vertical,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 50, 15, 0),
                      child: Text(
                        'Download our Android app',
                        textAlign: TextAlign.center,
                        softWrap: true,

                        style: TextStyle(color: Colors.white,fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 400,
                        child: Text(

                          'MANYS IS AVAILABLE OFFICIALLY ON PLAY STORE AND SOON ON APPLE STORE',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {},
                      child: Ink(
                        height: 45,
                        width: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.amberAccent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "DOWNLOAD",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                isScreenWide ? SizedBox(
                  width: 50,
                ): SizedBox(
                  height: 50,
                ),
                SizedBox(height: 500, child: ComplicatedImageDemo()),
              ],
            ),
            SizedBox(height: 150,),
            Text(
              "Frequently asked",
              style: TextStyle(color: Colors.white,
              fontSize:40, fontWeight: FontWeight.bold ),
              textAlign: TextAlign.center,
            ),
            Text(
              "questions",
              style: TextStyle(color: Colors.white,
                  fontSize:40, fontWeight: FontWeight.bold ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40,),
            Text("Answers to most common questions",
                style: TextStyle(color: Color.fromRGBO(120, 144, 156, 1),
                fontSize: 30),
                textAlign: TextAlign.center),
            SizedBox(height: 40,),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flex(
                    direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Column(
                        children: [
                          Text(
                            'WHAT CAN I DO WITH MANYS?',
                           // textAlign: TextAlign.center,

                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                              "You can track your vehicle\n in case"
                                  " of theft".toUpperCase(),
                              softWrap: true,
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                  color: Color.fromRGBO(120, 144, 156, 1))),
                        ],
                      ),
                      SizedBox(
                        width: 120,
                        height: 30,
                      ),
                      Column(
                        children: [
                          Text('Can I try it for free?'.toUpperCase(),
                              textAlign: TextAlign.center,

                              style: TextStyle(color: Colors.white)),
                          Text(
                              "MANYS IS TOTALLY FREE TO USE"
                                  ,
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(120, 144, 156, 1))),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Flex(
                    direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Why MANYS and not others ?'.toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                              "MANYS OFFERS SO MANY FUNCTIONALITIES \n"
                                  "SUCH US : UNLIMITED VEHICLE ADDING, \nBEAUTIFUL LAYOUTS, AVAILABLE GLOBALLY ",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(120, 144, 156, 1))),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                        height: 40,
                      ),
                      Column(
                        children: [
                          Text('How I can help MANYS'.toUpperCase(),
                              style: TextStyle(color: Colors.white)),
                          Text(
                              "THANKS FOR THINKING OF TAHT\n"
                                  "WE WOULD LOVE AS A TEAM TO SHARE \nTHE APPLICATION "
                                  "SO MANY OTHER PEOPLE \nDISCOVER MANYS\n",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(120, 144, 156, 1))),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Flex(
                    direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'How to use MANYS?'.toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                              "WE THOUGHT OF THAT EARLIER AND PROVIDED YOU\n WITH "
                                  "A user manual, Please CHECK IT OUT".toUpperCase(),
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(120, 144, 156, 1))),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text("Have questions?".toUpperCase(),
                style: TextStyle(color: Colors.white,fontSize: 20),
                textAlign: TextAlign.center),
            SizedBox(
              height: 40,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {},
              child: Ink(
                height: 35,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.amberAccent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CONTACT US",
                      style: TextStyle(
                         // fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 80,),
            Flex(
              direction: isScreenWide ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("ABOUT MANYS",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 15,)
                    ,SizedBox(
                      width: MediaQuery.of(context).size.width*0.8,

                      child: Text("MANYS is a project founded by six students from the higher school of Computer Science Algiers as an app and a website for geolocating and tracking.".toUpperCase(),
                        softWrap: true,
                        style: TextStyle(
                            color: Color.fromRGBO(120, 144, 156, 1), fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      "© 2021 MANYS - All Rights Reserved",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),

              ],

            ),

            // Text(
            //   "© 2021 MANYS - All Rights Reserved",
            //   style: TextStyle(color: Colors.white),
            // ),
          ],
        ),
      ),
    );
  }
}

class ComplicatedImageDemo extends StatelessWidget {
  final List<String> imgList = [
    'assets/assets/Sign_Up.png',
    'assets/assets/home.png',
    'assets/assets/history.png',
    'assets/assets/Send_Feedback.png'
  ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child:
            Image.network(item, fit: BoxFit.cover, width: 1000.0)),
      ),
    ))
        .toList();

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 0.6,
        enlargeCenterPage: true,
      ),
      items: imageSliders,
    );
  }
}
