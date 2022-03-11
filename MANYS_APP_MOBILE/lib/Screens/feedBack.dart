import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';


class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  String msg="",sub="";
  Email email;

  var message;
  // ignore: deprecated_member_use

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset:false,
        backgroundColor:Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.1),
          child: Column(
            children: [
              SizedBox(height:MediaQuery.of(context).size.height*0.01 ,),
              AppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50),
                  ),
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,

                  //change your color here
                ),

                backgroundColor:Color(0xffF4D657),// Color(0xff1c1c1c),
                title: Text('SEND FEEDBACK',
                  textAlign: TextAlign.center,
                  style: TextStyle(

                    color: Color(0xff1c1c1c),
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Color(0xffF4D657),
                        offset: Offset(0, 0),
                      ),],
                  ),),

                centerTitle: true,
              ),
            ],
          ),
        ),

        body: Container(
          margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.65,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(child: Column(
                  children: [

                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width*0.99,
                      child: TextFormField(
                        maxLines: 3,
                        minLines: 2,
                        style: TextStyle(color: Color(0xffd3b53f),fontSize: 16.0,),
                        onChanged: (val) => {
                          setState(()=>{sub=val}),
                        },
                        decoration: InputDecoration(
                          hintText: 'Subject',
                          prefixIcon: Icon(Icons.feedback, color: Color(0xffd3b53f),/*Color(0xffd3b53f),*/),


                          hintStyle: TextStyle(color:Color(0xffd3b53f),//Color(0xffd3b53f),
                              fontSize: 16.0),
                          filled: true,
                          focusedBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color:  Color(0xff1c1c1c), width: 2),),
                          fillColor :    Color(0xff353535),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color:   Color(0xff1c1c1c), width: 2),),

                        ),),
                    ),
                    SizedBox(height: 15,),

                    Container(
                      height: MediaQuery.of(context).size.height*0.35,
                      width: MediaQuery.of(context).size.width*0.99,
                      child: TextFormField(
                        style: TextStyle(color: Color(0xffd3b53f),/*Color(0xffd3b53f)*/fontSize: 16),
                        minLines: 10,
                        maxLines: 18,
                        onChanged: (val) => {
                          setState(()=>{msg=val}),
                        },
                        decoration: InputDecoration(

                          hintText: 'Write your feedback here...',


                          hintStyle: TextStyle(color: Color(0xffd3b53f),//Color(0xffd3b53f),
                              fontSize: 16.0),
                          filled: true,

                          fillColor:   Color(0xff353535),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color:   Color(0xff1c1c1c), width: 2),),
                          focusedBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color:  Color(0xff1c1c1c), width: 2),),

                        ),),
                    ),
                  ],
                )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/50,),
              // ignore: deprecated_member_use
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(12.0,0,12.0,0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xffd3b53f), width: 2),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(50),
                      top: Radius.circular(50),
                    ),
                  ),
                  color:Color(0xffd3b53f),
                  height: 50,



                  onPressed: () async =>{




                    email = Email(
                      body: msg,
                      subject: sub,
                      recipients: ['ne.chenni@gmail.com'],
                    ),
                    await FlutterEmailSender.send(email),
                  Navigator.of(context).pop(),
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
                  child:      Text("SEND",
                    style: TextStyle(
                      color: Color(0xff1c1c1c),//Color(0xffF4D657),
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,

                    ),),),
              ),

            ],
          ),
        ),

      ),
    );
  }
}

