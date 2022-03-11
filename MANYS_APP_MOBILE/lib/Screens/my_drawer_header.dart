import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:koko/Services/FirestoreService.dart';

class MyHeaderDrawer extends StatefulWidget {

  String name="";
  MyHeaderDrawer(String name){
    this.name=name;
  }
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getUserName();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(height: 8,),
          Text(
            widget.name==null ? '':widget.name.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          // Text(
          //   "",
          //   style: TextStyle(
          //     color: Colors.grey[200],
          //     fontSize: 14,
          //   ),
          // ),
        ],
      ),
    );
  }
}
