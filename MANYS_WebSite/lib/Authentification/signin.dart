import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Manys/Authentification/reset.dart';
import 'package:Manys/Routes.dart';
import 'package:Manys/Screens/HomeLawlaGa3.dart';
import 'package:Manys/Screens/PrivacyPolicy.dart';
import 'package:Manys/Screens/feedBack.dart';
import 'package:Manys/Services/auth.dart';
import 'package:Manys/main.dart';
import 'package:Manys/shared/loading.dart';
import 'package:vrouter/vrouter.dart';

import '../SaveUserInfo.dart';

class SignIn extends StatefulWidget {
  static String RouteToHome;
  @override
  _SignInState createState() => _SignInState();
}

//
class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  bool passwordVisible = false;
  String email  ;
  String password ;
  String error = '';
  bool _checkbox = false;
  @override
  Widget build(BuildContext context) {

    return loading
        ? Loading()
        : Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: Colors.black,
            body: Center(
              child: Container(
                margin:
                    EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 50),
                height: 420,
                width: 360,
                decoration: BoxDecoration(
                  color: Color(0xff1d1f20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff656565),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      color: Color(0xff1A1C1D),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            //       SizedBox(width: 130,),
                            Icon(
                              Icons.lock,
                              color: Color(0xbbffD3B53F),
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                color: Color(0xffF4D657),
                                letterSpacing: 1.5,
                                fontSize: 17,
                                shadows: [
                                  Shadow(
                                    blurRadius: 0.5,
                                    color: Color(0xffF4D657),
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            Container(
                              width: 300,
                              height: 45,
                              child: TextFormField(
                                style: TextStyle(color: Color(0xffd3b53f)),
                                //  validator: (val)=>val.isEmpty? 'Enter an email ':null,
                                onChanged: (val) => {
                                  setState(() => {email = val}),
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color(0xaaF4D657),
                                  ),
                                  hintStyle: TextStyle(
                                      color: Color(0xbbF4D657), fontSize: 13.0),
                                  hintText: "Enter Email",
                                  filled: true,
                                  fillColor: Color(0xff353535),
                                  enabledBorder: OutlineInputBorder(
                                    //  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Color(0xff353535), width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Color(0xff1c1c1c), width: 2),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 300,
                              height: 45,
                              child: TextFormField(
                                style: TextStyle(color: Color(0xffd3b53f)),
                                //validator: (val)=>val.length<6? 'password too short ':null,
                                onChanged: (val) => {
                                  setState(() => {password = val}),
                                },

                                obscureText: passwordVisible ? false : true,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xfa373b3d), width: 2),
                                  ),
                                  hintText: ' Password',
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Color(0xaaF4D657),
                                  ),
                                  hintStyle: TextStyle(
                                      color: Color(0xbbF4D657), fontSize: 13.0),
                                  filled: true,
                                  fillColor: Color(0xff353535),
                                  suffixIcon: IconButton(
                                    icon: passwordVisible
                                        ? Icon(
                                            Icons.visibility,
                                            color: Colors.grey,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(width: 100,),
                        Checkbox(
                          checkColor: Colors.black,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors
                                    .white70; // the color when checkbox is selected;
                              }
                              return Color(
                                  0xff373b3d); //the color when checkbox is unselected;
                            },
                          ),
                          value: _checkbox,
                          onChanged: (value) {
                            setState(() {
                              _checkbox = !_checkbox;
                            });
                          },
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            // fontFamily:  'B612',
                            fontSize: 13,
                            color: Color(0xffF4D657),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // ignore: deprecated_member_use
                    FlatButton(
                      height: 40,
                      minWidth: 100,
                      onPressed: () async {
                        if (password.isEmpty || email.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'There are a fields missing',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          if (_formkey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });

                            var result = await _auth
                                .signInWithEmailAndPassword(email, password);

                            if (result == null){

                              setState(() {
                                loading = false;
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    'Wrong email or password',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                ));
                                error = "not user";
                              });
                            }

                            else{

                              setState(() {
                                loading = false;
                               // SignIn.RouteToHome='/Home/${SaveUserInfo.id}';
                              });

                              // Navigator.of(context).popUntil((route) => route.isFirst);
                              //
                              RoutePaths.Home='/Home/${SaveUserInfo.id}';
                              context.vRouter.pushReplacementNamed('home', pathParameters: {
                                'uid':SaveUserInfo.id,
                              });

                            }
                          }
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xffF4D657),
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      color: Color(0xff353535),
                    ),
                    SizedBox(
                      height: 20,
                    ),
// ignore: deprecated_member_use
                    Center(
                      child: FlatButton(
                        onPressed: () => Navigator.of(context).pushNamed('/Reset'),
                        child: Container(
                          width: 200,
                          child: Center(
                            child: Text(
                              "Forgot your password?",
                              style: TextStyle(
                                color: Color(0xffF4D657),
                                fontSize: 14,
// fontFamily: 'B612',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
// ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () => Navigator.of(context).pushNamed('/Privacy'),
                      child: Container(
                        width: 200,
                        child: Center(
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: Color(0xffF4D657),
                              fontSize: 13,
// fontFamily: 'B612',
                            ),
                          ),
                        ),
                      ),
                    ),

//  Image.asset("assets/world.jpg"),
                  ],
                ),
              ),
            ));
  }
}
