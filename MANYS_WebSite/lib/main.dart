import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Manys/Authentification/signin.dart';
import 'package:Manys/Authentification/start.dart';
import 'package:Manys/Routes.dart';
import 'package:Manys/Screens/HistoryPolylines.dart';
import 'package:Manys/Screens/HomeLawlaGa3.dart';
import 'package:Manys/models/user.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:vrouter/vrouter.dart';

import 'Authentification/reset.dart';
import 'SaveUserInfo.dart';
import 'Screens/History.dart';
import 'Screens/PrivacyPolicy.dart';
import 'Screens/SecondPage.dart';
import 'Screens/feedBack.dart';
import 'Services/auth.dart';


void main()  {

 // setPathUrlStrategy();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // static bool isRunning;
  // static LocationDto lastLocation;
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {



@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: null,
      child: VRouter(

        routes: [
          VWidget(path: RoutePaths.Start, widget: Start(), name: 'start'),
          VWidget(path: RoutePaths.Privacy, widget: PrivacyPolicy(),name: 'privacy'),
          VWidget(path: RoutePaths.FeedBack, widget: FeedBack(), name: 'feedback'),
          VWidget(path: RoutePaths.Login, widget: SignIn(), name: 'login'),
          VWidget(path: RoutePaths.Reset, widget: ResetScreen(), name:'reset'),
          VWidget(path: "/TrackingMap/:codeBar", widget: SecondPage(), name: 'map'),
          VWidget(path: '/Home/:uid', widget: HomePrincipal(), name: 'home'),
          VWidget(path: '/History/:points', widget: HistoryPolylines(), name: 'history'),

          VRouteRedirector(path: ':_(.*)', redirectTo: "/"),

        ],
        title: 'MANYS',
        debugShowCheckedModeBanner: false,
       // home:Wrapper(true),
      ),
    );
  }



}

class HomePage extends StatefulWidget {
  final Widget child;

  const HomePage({Key key, this.child}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

