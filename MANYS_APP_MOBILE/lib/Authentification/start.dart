import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  Function toggleStart;
  Start({this.toggleStart});
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    double he=hei/10;
    return Scaffold(
      backgroundColor: Color(0xff1c1c1c),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top:-100,
                  left:-100,
                  right: -100,
                  child: Container(
                    width: wid+200,
                    height: hei-(hei/3)+140,
                    decoration: BoxDecoration(
                      color: Color(0xffF4D657),
                      borderRadius: BorderRadius.circular(1800),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: hei/3.25,),
                        Image.asset("assets/logo0p.png"),
                        SizedBox(height: hei/20,),
                        Text('MANYS TRACKER',
                          style: TextStyle(
                            color:  Color(0xff1c1c1c),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Color(0xff1c1c1c),
                                offset: Offset(0, 0),
                              ),],
                          ),),
                        SizedBox(height: hei/40,),
                        SizedBox(
                          height: hei/20,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 22,
                              color: Color(0xff1c1c1c),
                              shadows: [
                                Shadow(
                                  blurRadius: 7.0,
                                  color: Color(0xfff353535),
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,

                              animatedTexts: [
                                TypewriterAnimatedText(' insure your car'.toUpperCase(),
                                    speed: Duration(milliseconds:150)),
                              ],
                              onTap: () {
                                print("Tap Event");
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],),
          ),
          // ignore: deprecated_member_use
          FlatButton(
            height: hei/14,
            minWidth: wid-wid/4,
            onPressed: (){
              widget.toggleStart();
            },
            child: Text("GET STARTED",
              style: TextStyle(
                color: Color(0xff1c1c1c),
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Color(0xff1c1c1c),
                    offset: Offset(0, 0),
                  ),],
              ),),
            //shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            color: Color(0xffF4D657),
          ),
          SizedBox(height: hei/10,),
        ],),);



  }
}
