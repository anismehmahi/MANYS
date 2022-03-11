import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koko/Screens/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BarCode.dart';
class CarOrUser extends StatefulWidget {
  @override
  _CarOrUserState createState() => _CarOrUserState();
}

class _CarOrUserState extends State<CarOrUser> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1c1c1c),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Text("SELECT DEVICE'S ROLE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: deprecated_member_use
                  Column(
                    children: [
                      IconButton(icon: Image.asset("assets/car.png",),
                        iconSize: MediaQuery.of(context).size.width*0.48,
                        padding: EdgeInsets.all(0),
                        onPressed: ()async{
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await  prefs.setString('test', "Car");
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>BarcodeCreatePage()));
                        },
                      ),
                      Text("CAR",style: TextStyle(
                        color: Colors.white,
                      ),),

                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  // ignore: deprecated_member_use
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(icon: Image.asset("assets/user.png",),
                        padding: EdgeInsets.all(0),
                        iconSize: MediaQuery.of(context).size.width*0.48,
                        onPressed: ()async{
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setString('test', "User");
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Wrapper(false)));

                        },),
                      Text("USER",style: TextStyle(
                        color: Colors.white,
                      ),),
                    ],
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
