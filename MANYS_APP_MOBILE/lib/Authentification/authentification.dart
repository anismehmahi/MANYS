import 'package:flutter/cupertino.dart';
import 'package:koko/Authentification/registre.dart';
import 'package:koko/Authentification/signin.dart';
import 'package:koko/Authentification/start.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn=true;
  bool showStart=true;
  void toggleView(){
    setState(() {
      this.showSignIn=!showSignIn;
    });
  }
  void toggleStart(){
    setState(() {
      this.showStart=!showStart;
    });
  }
  @override
  Widget build(BuildContext context)  {
   // return RegisterScreen();
    // return LoginScreen();
    if(showStart) return Start(toggleStart: toggleStart);
    else {
      if (showSignIn)
        return SignIn(toggleView: toggleView);
      else
        return Registre(toggleView: toggleView);
    }
  }
}