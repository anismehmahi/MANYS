import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Manys/Authentification/signin.dart';
import 'package:Manys/SaveUserInfo.dart';
import 'package:Manys/Screens/HomeLawlaGa3.dart';
import 'package:Manys/Screens/feedBack.dart';

import 'Authentification/reset.dart';
import 'Authentification/start.dart';
import 'Screens/PrivacyPolicy.dart';
import 'Screens/SecondPage.dart';
import 'dart:html' as html;
class RoutePaths {
  static const Start = '/';
  static const Privacy = '/Privacy';
  static const Reset = '/Reset';
  static const FeedBack = '/FeedBack';
  static const TrackingMap = '/TrackingMap';
  static const Login = '/Login';
  static String Home = '/Home/${SaveUserInfo.id}';

}

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var url = html.window.location.href;
   List<String> urls = url.split('/');
   if(url.contains('Home')){
     SaveUserInfo.id=urls.last;
     print('hh ${urls.last}');
   }
   print(html.window.location.href.toString()[html.window.location.href.toString().length-1]);

    if(settings.name == RoutePaths.Start ){return MaterialPageRoute(
        settings: settings, // <--- add

        builder: (_) => Start());}

    else if(settings.name ==  RoutePaths.Privacy ){return MaterialPageRoute(
        settings: settings, // <--- add

        builder: (_) => PrivacyPolicy());}
  else  if(settings.name == RoutePaths.FeedBack)
  {return MaterialPageRoute(
        settings: settings, // <--- add

        builder: (_) => FeedBack());}
    else if(settings.name == RoutePaths.Login ){return MaterialPageRoute(
        settings: settings, // <--- add

        builder: (_) => SignIn());}
   else  if(settings.name == RoutePaths.Reset ){return MaterialPageRoute(
       settings: settings, // <--- add

        builder: (_) => ResetScreen());}
   else  if(settings.name == RoutePaths.TrackingMap ){return MaterialPageRoute(
        settings: settings, // <--- add

        builder: (_) => SecondPage());}
   else  if(settings.name == RoutePaths.Home){

      return MaterialPageRoute(
        settings: settings, // <--- add

        builder: (_) => HomePrincipal());
   }

  }
}