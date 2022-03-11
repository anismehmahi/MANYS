import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  String msg="",sub="";
  Email email;
  String username = 'ne.chenni@gmail.com';
  String password = 'nidhal19061924';
  var smtpServer;
  var message;
  // ignore: deprecated_member_use

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,

      body: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          width: 360,
          height: 420,
          // color:  Color(0xff353535),
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

       //   color: Color(0xff1c1c1c),

          child: Column(
            children: [
              Container(
                //   color: Color(0xff1c1c1c),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Send Feedback',
                    style: TextStyle(
                      color: Color(0xffF4D657),
                      letterSpacing: 1.5,

                      fontSize: 17,
                      shadows: [
                        Shadow(
                          blurRadius: 0.5,
                          color: Color(0xffF4D657),
                          offset: Offset(0, 0),
                        ),],
                    ),),
                ),
              ),
              Divider(
                color: Color(0xff676767),
                height: 0.2,
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(child: Column(
                  children: [

                    Container(
                      height: 40,
                      width: 340,
                      child: TextFormField(
                        style: TextStyle(color: Color(0xffd3b53f)),
                        onChanged: (val) => {
                          setState(()=>{sub=val}),
                        },
                        decoration: InputDecoration(
                          hintText: 'Subject',
                          prefixIcon: Icon(Icons.feedback, color: Color(0xffd3b53f),),


                          hintStyle: TextStyle(color: Color(0xffd3b53f),
                              fontSize: 13.0),
                          filled: true,
                          focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color:  Color(0xff303030), width: 2),),
                          fillColor :    Color(0xff353535),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:  Color(0xff303030), width: 2),),

                        ),),
                    ),
                    SizedBox(height: 20,),

                    Container(
                      height: 180,
                      width: 340,
                      child: TextFormField(
                        style: TextStyle(color: Color(0xffd3b53f)),
                        minLines: 8,
                        maxLines: 11,
                        onChanged: (val) => {
                          setState(()=>{msg=val}),
                        },
                        decoration: InputDecoration(
                          hintText: 'Write your feedback here...',


                          hintStyle: TextStyle(color: Color(0xffd3b53f),
                              fontSize: 13.0),
                          filled: true,

                          fillColor:   Color(0xff353535),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:  Color(0xff303030), width: 2),),
                          focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color:  Color(0xff303030), width: 2),),

                        ),),
                    ),
                  ],
                )),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                color: Color(0xff353535),
                height: 50,
                  minWidth: 100,
                  onPressed: () async =>{

                  // ignore: deprecated_member_use


                  email = Email(
                  body: msg,
                  subject: sub,
                  recipients: ['ne.chenni@gmail.com'],
                  ),
                  FlutterEmailSender.send(email),

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(     SnackBar(

                  content: Text('Thanks for giving us your feedback',
                    textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                  backgroundColor: Colors.green,
                  ))
                  },
                  child:      Text("Send",
                   style: TextStyle(
                       color: Color(0xffF4D657),
                       letterSpacing: 1.5,
                       fontWeight: FontWeight.bold,
                       fontSize: 18,

                ),),),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),

    );
  }
}
