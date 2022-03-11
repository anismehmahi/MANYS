import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Manys/Services/FirestoreService.dart';

import '../SaveUserInfo.dart';

class MyHeaderDrawer extends StatefulWidget {
  String name='';

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  Future<String> getUserName()async {
    FirestoreService firestoreService = FirestoreService();
    FirebaseFirestore db= FirebaseFirestore.instance;

    DocumentSnapshot qr= await db.collection('Users').doc(firestoreService.getId()).get();

      return qr.data()['UserName'].toString();



    }
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirestoreService firestoreService = FirestoreService();
    FirebaseFirestore db= FirebaseFirestore.instance;

     db.collection('Users').doc(firestoreService.getId()).get().then((value) {

        setState(() {
          widget.name = value.data()['UserName'].toString() ;
        });
    });
Future.delayed(Duration(milliseconds: 200),(){});




      print(widget.name+"okkkkkkkk");

  }
  @override
  Widget build(BuildContext context) {
//print(widget.name+"ddddddddd");

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
          SizedBox(height: 20,),
          Text(widget.name.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),

        ],
      ),
    );
  }
}
