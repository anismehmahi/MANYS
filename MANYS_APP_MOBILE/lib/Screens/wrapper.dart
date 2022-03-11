
import 'package:flutter/material.dart';
import 'package:koko/Authentification/authentification.dart';
import 'package:koko/Screens/CarOrUser.dart';
import 'package:koko/Screens/HomeLawlaGa3.dart';
import 'package:koko/models/user.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SaveUserInfo.dart';
import 'BarCode.dart';
import 'Home.dart';


class Wrapper extends StatefulWidget {
bool showMode ;

Wrapper(@required bool show){
  showMode=show;
}
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String test  = '';
  getTest()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      test = prefs.getString('test');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  getTest();
  }

  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if(user==null) {
      widget.showMode=true;
      return Authenticate();
    }
   return widget.showMode == true ?CarOrUser() : HomePrincipal();
  // else{
  //   if(widget.showMode){
  //   if(test=='Car'){    return BarcodeCreatePage(data: 'te3is',);
  //   }
  //   if(test=='User'){return Wrapper(false);}
  //
  //   // last case
  //   return CarOrUser();
  //   }
  //   else{
  //   return HomePrincipal();
  //   }
  //   }
  }
}