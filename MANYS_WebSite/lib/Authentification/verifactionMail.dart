import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Manys/Screens/HomeLawlaGa3.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  FirebaseUser user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser as FirebaseUser;
     user.sendEmailVerification();

     timer =  Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4d657),
      body: Center(
        child: Text(
            'An email has been sent to  please verify'),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser as FirebaseUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePrincipal()));
    }
  }
}