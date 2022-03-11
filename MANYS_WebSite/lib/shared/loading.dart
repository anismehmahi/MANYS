import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff353535),
      child: Center(

        child: SpinKitRipple(
          color: Color(0xffd3b53f),
          size: 100,
        ),
      ),
    );
  }
}
