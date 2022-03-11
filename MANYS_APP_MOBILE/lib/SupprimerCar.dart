import 'package:flutter/material.dart';

import 'Screens/HomeLawlaGa3.dart';
import 'Screens/wrapper.dart';
import 'Services/FirestoreService.dart';


class SupprimerCar extends StatefulWidget {

  int index;
  String id;
  SupprimerCar(int index,String id){
    this.index=index;
    this.id=id;
  }
  @override
  _SupprimerCarState createState() => _SupprimerCarState();
}

class _SupprimerCarState extends State<SupprimerCar> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("WARNING"),
          Icon(Icons.warning,color: Colors.red,)
        ],),
      content: new Text("DO YOU REALLY WANT TO DELETE THE VEHICLE ? ",textAlign: TextAlign.start,),
      actions: <Widget>[

        new FlatButton(
          child: new Text("DONE"),
          onPressed: () {
            setState(() {
              FirestoreService     firestoreService = FirestoreService();
              firestoreService.deleteCar(id: widget.id);
            });
            Navigator.of(context).pop();


            Navigator.of(context).pushReplacement( PageRouteBuilder(
              pageBuilder: (c, a1, a2) => Wrapper(false),
              transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
              transitionDuration: Duration(milliseconds: 200),
            ),);
          },
        ),
        FlatButton(
          child: new Text("CANCEL"),
          onPressed: () {

            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
