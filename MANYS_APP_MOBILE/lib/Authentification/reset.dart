
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String email="";
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff1c1c1c),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.1),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.01 ,),
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
                title: Text('RESET PASSWORD',
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

        body: Column(
          children: [
            SizedBox(height: 50,),
            Container(child: Image.asset("assets/reset.png"),
              width: wid/1.2,
              height: hei/5,),
            SizedBox(height: hei/25,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                style: TextStyle(color: Color(0xffd3b53f),),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Color(0xffd3b53f)),
                  hintStyle: TextStyle(color: Color(0xffd3b53f),
                      fontSize: 14.0),
                  hintText: "Enter Email",
                  filled: true,
                  fillColor: Color(0xff353535),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color:  Color(0xff1c1c1c), width: 2),),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Color(0xff1c1c1c), width: 2),),

                ),
      onChanged: (val) => {
      setState(()=>{email=val}),
      },

              ),
            ),
            SizedBox(height: hei/25,),
            Container(child: Text("Enter your email and we will sent you a link to reset your password ",
              textAlign: TextAlign.center,
              style: TextStyle( color: Color(0xffd3b53f),
                letterSpacing: 0.3,

                fontSize: 16,
                shadows: [
                  Shadow(
                    blurRadius: 1.0,
                    color: Color(0xff353535),
                    offset: Offset(0, 0),
                  ),],
              ),),
              width: wid*0.8,
            ),
            SizedBox(height: hei/10,),

            // ignore: deprecated_member_use
            Container(
              height: 70,
              width: wid,
              padding: const EdgeInsets.all(12.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffd3b53f), width: 2),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50),
                    top: Radius.circular(50),
                  ),
                ),
                child: Text('SEND',
                  style: TextStyle(
                    color: Color(0xff1c1c1c),
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color:Color(0xff353535),
                        offset: Offset(0, 0),
                      ),],
                  ),),
                onPressed: () async {
                  if(email.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(     SnackBar(
                      content: Text('Missing email Field',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),),
                      backgroundColor: Colors.red,
                    ));
                  }
                  else{
                    try{
                  await auth.sendPasswordResetEmail(email: email);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(     SnackBar(

                    content: Text('An email has been sent to you',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),),
                    backgroundColor: Colors.green,
                  ));}catch (e){
                      ScaffoldMessenger.of(context).showSnackBar(     SnackBar(

                        content: Text('Email not registered in our DataBase',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),),
                        backgroundColor: Colors.red,
                      ));
                    }
                  }
                },

                color: Color(0xffd3b53f),

              ),
            ),
          ],),
      ),
    );
  }
}