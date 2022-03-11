import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'SaveUserInfo.dart';
import 'Screens/HomeLawlaGa3.dart';
import 'Screens/ScanCode.dart';
import 'Screens/wrapper.dart';
import 'Services/FirestoreService.dart';

class ADDCAR extends StatefulWidget {
  @override
  _ADDCARState createState() => _ADDCARState();
}

class _ADDCARState extends State<ADDCAR> {
  String _value;
  String asset;
  String non = "assets/non2.png";
  String sport = "assets/sideWhite.png";
  String moto = "assets/sideMoto.png";
  String x4x = "assets/sideRed.png";
  TextEditingController num = TextEditingController();
  TextEditingController name = TextEditingController();
  String barCode = "-1";
  Future<String> scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return "";

      // setState(() {
      //   this.barcode = barcode;
      // });
      return barcode;
    } on PlatformException {
      return 'Failed to get platform version.';
    }
  }
  final  formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text(
            "ADD VEHICLE",
            style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: new Builder(builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                try {
                  Navigator.pop(context); //close the popup
                } catch (e) {}
              },
            );
          }),
          brightness: Brightness.light,
        ),
        // resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 2, 14, 0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (ctx) {
                    switch (_value?.toLowerCase()) {
                      case "sport":
                        {
                          return Image(
                            image: AssetImage(sport),
                            height: 130,
                            width: 200,
                          );
                        }
                      case "moto":
                        {
                          return Image(

                            image: AssetImage(moto),
                            height: 130,
                            width: 200,
                          );
                        }
                      case "4x4":
                        {
                          return Image(
                            image: AssetImage(x4x),
                            height: 130,
                            width: 200,
                          );
                        }
                      default:
                        {
                          return Image(
                            image: AssetImage(non),
                            height: 130,
                            width: 200,
                          );

                        }
                    }
                  }),
                  SizedBox(
                    height: _value == null ? 10 : 0,
                  ),
                  Container(
                    height: 60,
                    child: TextFormField(
                      onChanged: (val){
                        //formKey.currentState.validate();

                      },
                      validator: (value){
                        if(value.isNotEmpty){
                          return null;
                        }

                        else{
                          return "REQUIRED";
                        }},
                      controller: name,
                      decoration: InputDecoration(
                          hintText: "Marque",
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                  Container(
                    height: 60,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: num,
                      onChanged: (val){
                        //formKey.currentState.validate();

                      },
                      validator: (value) {
                        if (value.isNotEmpty) {
                          return null;
                        } else {
                          return "REQUIRED";
                        }
                      },
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Phone Number",
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    child: DropdownButtonFormField<String>(
                        value: _value,
                        isExpanded: true,
                        hint: Text('TYPE'),
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        // underline: Container(
                        //   margin: const EdgeInsets.only(
                        //       left: 0, top: 20, right: 0, bottom: 0),
                        //   child: Container(
                        //     height: 1,
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        validator: (value){
                          if(value==null || value.isEmpty ){return 'REQUIRED';}
                          else{return null;}
                        },
                        onChanged: (newValue) {
                          setState(() {
                            _value = newValue;
                           // formKey.currentState.validate();

                          });
                        },
                        items: [
                          DropdownMenuItem<String>(
                            value: 'MOTO',
                            onTap: () {
                              setState(() {
                                _value = "moto";
                                asset = moto;
                                FocusScope.of(context).requestFocus(new FocusNode());

                              });
                            },
                            child: Text('MOTO'),
                          ),
                          DropdownMenuItem<String>(
                            value: "SPORT",
                            onTap: () {
                              setState(() {
                                _value = 'sport';
                                asset = sport;
                                FocusScope.of(context).requestFocus(new FocusNode());

                              });
                            },
                            child: Text("SPORT"),
                          ),
                          DropdownMenuItem<String>(
                            value: "4X4",
                            onTap: () {
                              setState(() {
                                _value = "4x4";
                                asset = x4x;
                                FocusScope.of(context).requestFocus(new FocusNode());

                              });
                            },
                            child: Text("4X4"),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: _value == null
                        ? 10
                        : MediaQuery.of(context).size.height * (1 - 0.960),
                  ),
                  // barCode == "-1"
                  //     ? Container()
                  //     : Icon(
                  //         Icons.done,
                  //         color: Colors.green,
                  //         size: 40,
                  //       ),
                  // barCode == "-1"
                  //     ? Container()
                  //     : Text(
                  //         '$barCode',
                  //         style: TextStyle(
                  //           fontSize: 20,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () async {
                      //  barCode = await Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>BarcodeScanPage()));
                      String i = await scanBarcode();
                      if(i=="-1"){
                        Flushbar(
                          message: "WRONG CODE",
                          icon: Icon(
                            Icons.warning,
                            size: 28.0,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.red[900],
                          duration: Duration(seconds: 3),
                          leftBarIndicatorColor: Colors.white,
                        )..show(context);
                      }
                      else{
                        Flushbar(
                          message: "CORRECT CODE",
                          icon: Icon(
                            Icons.done,
                            size: 28.0,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.green[900],
                          duration: Duration(seconds: 3),
                          leftBarIndicatorColor: Colors.white,
                        )..show(context);
                      }
                      setState(() {
                        barCode = i;
                      });
                    },
                    child: Ink(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.amberAccent,
                        ),
                        child: Center(child: Text('SCAN THE QRCODE'))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () async {

                    if(barCode=='-1'){
                      Flushbar(
                        message: "PLEASE SCAN VEHICLE CODE",
                        icon: Icon(
                          Icons.warning,
                          size: 28.0,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.red[900],
                        duration: Duration(seconds: 3),
                        leftBarIndicatorColor: Colors.white,
                      )..show(context);
                    }
                  if(formKey.currentState.validate() && barCode!="-1"){
                    FirestoreService firestoreService = FirestoreService();
                   Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => Wrapper(false),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 200),
                      ),
                    );

                      Future.delayed(Duration(milliseconds: 200),(){
                      Flushbar(
                      message: "YOUR VEHICLE HAS BEEN SUCCESSFULLY ADDED",
                      icon: Icon(
                      Icons.done,
                      size: 28.0,
                      color: Colors.white,
                      ),
                      backgroundColor: Colors.green[900],
                      duration: Duration(seconds: 3),
                      leftBarIndicatorColor: Colors.white,
                      )..show(context);
                    });
                    print(SaveUserInfo.id);
                    await firestoreService.addnewCar(
                      carName: name.text,
                      phoneNumber: num.text,
                      type: _value,
                      barCode: barCode,
                    );

                  }
                      // print(SaveUserInfo.id);
                    },
                    child: Ink(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.amberAccent,
                        ),
                        child: Center(child: Text('SAVE VEHICLE'))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
