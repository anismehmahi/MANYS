import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:koko/googleMap.dart';
import 'package:ripple_animation/ripple_animation.dart';
import 'package:sms_maintained/sms.dart' as bb;


class SendSms extends StatefulWidget {
  String adress;
  SendSms(this.adress);
  @override
  _SendSmsState createState() => new _SendSmsState();
}

class _SendSmsState extends State<SendSms> {

  Position position;

  bb.SmsReceiver receiver = new bb.SmsReceiver();

  Key _key;
  bool _show = true;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
   bb.SmsSender sender = new bb.SmsSender();

    sender.sendSms(new bb.SmsMessage(widget.adress, "Manys want your location"));

}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        backgroundColor: Color(0xff1C1C1C),

        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Localisation",style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              _show == true ? Expanded(
                flex: 2,
                child: Center(
                  child: RippleAnimation(
                      repeat: true,
                      key: _key,
                      color: Color.fromRGBO(221, 65, 53, 1),
                      minRadius: 55,
                      ripplesCount: 6,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(221, 65, 53, 1),
                        ),
                        child: Icon(

                          Icons.speaker_phone,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                  ),),
              ) : Container(),
              Expanded(

                flex: 1,
                child: StreamBuilder<bb.SmsMessage>(
                  stream: receiver.onSmsReceived,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // RE
                     // print(snapshot.data.body);

                      if (snapshot.data.body.contains('Coordinates')) {
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            _show = false;
                          });
                        });

                           double x = double.tryParse(snapshot.data.body.split(" ")[2]);
                        double y = double.tryParse(snapshot.data.body.split(" ")[3]);
                       // Coordinates coordinates = Coordinates(x, y);
                        return Column(
                          children: [
                            SizedBox(
                                height:40,
                                child: Center(child: Text(
                                  "${snapshot.data.body}", style: TextStyle(
                                    fontSize: 16,
                                  color: Colors.white
                                ),))),
                             Expanded(child: MapSample(x,y)),
                          ],
                        );
                      }
                      else {
                        return Center(child: Text(''));
                      }
                    }
                    else {
                      return Center(child: Text(''));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
/*  getCurrentLocation()async{
    //await GetPermission();
    Position temp =  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
   // print("The latitude  -> ${temp.latitude}");
    //print("The longitude -> ${temp.longitude}");

    return temp;
  }*/
}