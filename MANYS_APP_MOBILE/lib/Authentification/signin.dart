import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koko/Authentification/reset.dart';
import 'package:koko/Services/auth.dart';
import 'package:koko/shared/loading.dart';
class SignIn extends StatefulWidget {
  Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final  AuthService _auth=AuthService();
  final _formkey=GlobalKey<FormState>();
  bool loading=false;
  bool passwordVisible=false;
  String email='';
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    double he=hei/10;
    return loading? Loading():Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: Color(0xff1c1c1c),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top:-100,
                  left:-100,
                  right: -100,
                  child: Container(
                    width: wid+200,
                    height: hei-(hei/3)+140,
                    decoration: BoxDecoration(
                      color: Color(0xffF4D657),
                      borderRadius: BorderRadius.circular(1800),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: hei/15,),
                        Container(
                          width: wid,
                          child: Padding(

                            padding: const EdgeInsets.fromLTRB(20, 110, 0,5),
                            child: Text("Welcome to",
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 1.0,
                                //fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 2.0,
                                    color: Color(0xff1c1c1c),
                                    offset: Offset(0, 0),
                                  ),],
                              ),),
                          ),
                        ),
                        Container(
                          width: wid,
                          child: Padding(
                            padding:EdgeInsets.fromLTRB(25, 5, 0, 15),
                            child: Text('MANYS TRACKER',
                              style: TextStyle(
                                color:  Color(0xff1c1c1c),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                shadows: [
                                  Shadow(
                                    blurRadius: 2.0,
                                    color: Color(0xff1c1c1c),
                                    offset: Offset(0, 0),
                                  ),],
                              ),), ),
                        ),
                        Container(
                          width: wid,

                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                            child: Text("Please Login To Continue",
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 1.0,
                                //  fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 2.0,
                                    color: Color(0xff1c1c1c),
                                    offset: Offset(0, 0),
                                  ),],
                              ),),
                          ),
                        ),
                        Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(height: hei/25,),
                              Container(
                                width: wid-wid/14,
                                height: hei/14,

                                  child: TextFormField(

                                   // validator: (val)=>val.isEmpty? 'Enter an email ':null,
                                    onChanged: (val) => {
                                      setState(()=>{email=val}),
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Enter Email',

                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide: BorderSide(color: Colors.blue, width: 2),),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide: BorderSide(color: Color(0xffD3B53F), width: 2),),
                                      prefixIcon: Icon(Icons.email, color: Color(0xbb353535),),
                                      hintStyle: TextStyle(color: Color(0xbb353535),
                                          fontSize: 13.0),
                                      filled: true,

                                      fillColor: Color(0xffeccb44),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide: BorderSide(color:  Color(0xffeccb44), width: 2),),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                        borderSide: BorderSide(color: Color(0xffD3B53F), width: 2),),
                                    ),
                                  ),

                              ),
                              SizedBox(height: hei/30,),
                              Container(
                                width: wid-wid/14,
                                height: hei/14,
                                child: TextFormField(
                                 // validator: (val)=>val.length<6? 'password too short ':null,
                                  onChanged: (val) => {
                                    setState(()=>{password=val}),
                                  },
                                  obscureText: passwordVisible? false :true,
                                  decoration: InputDecoration(
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Color(0xffD3B53F), width: 2),),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.red, width: 2),),
                                    hintText: 'Password',
                                    prefixIcon: Icon(Icons.lock, color: Color(0xbb353535),),
                                    hintStyle: TextStyle(color: Color(0xbb353535),
                                        fontSize: 13.0),
                                    filled: true,
                                    fillColor: Color(0xffeccb44),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color:  Color(0xffeccb44), width: 2),),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Color(0xffD3B53F), width: 2),),
                                    suffixIcon: IconButton(
                                      icon: passwordVisible? Icon(Icons.visibility,color: Colors.grey,) :Icon(Icons.visibility_off,color: Colors.grey,),
                                      onPressed: (){
                                        setState(() {
                                          passwordVisible=!passwordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: hei/15,),
                              // ignore: deprecated_member_use
                              FlatButton(
                                height: hei/14,
                                minWidth: wid-wid/14,
                                onPressed: () async {
                                  if(email==''){
                                    ScaffoldMessenger.of(context).showSnackBar(     SnackBar(

                                      content: Text('Missing email Field',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                  else if(password==''){
                                    ScaffoldMessenger.of(context).showSnackBar(     SnackBar(

                                      content: Text('Missing password field',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                  else{
                                  if(_formkey.currentState.validate()){
                                    setState(() {
                                      loading=true;
                                    });

                                    dynamic result=await _auth.signInWithEmailAndPassword(email, password);
                                    if(result==null) setState(() {
                                      loading=false;
                                      ScaffoldMessenger.of(context).showSnackBar(     SnackBar(

                                        content: Text('Wrong email or password',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),),
                                        backgroundColor: Colors.red,
                                      ));
                                      error="not user";
                                    });}
                                  }
                                },
                                child: Text("LOGIN",
                                  style: TextStyle(
                                    color: Color(0xffF4D657),
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 2.0,
                                        color: Color(0xffF4D657),
                                        offset: Offset(0, 0),
                                      ),],
                                  ),),
                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                color: Color(0xff1c1c1c),
                              ),
                              SizedBox(height: hei/40,),
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: ()=>Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => ResetScreen())),
                                 child: Container(
                                  width: wid,
                                  child: Center(
                                    child: Text("FORGOT PASSWORD ?",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                  ),

                                ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),),
          Container(
            // margin: EdgeInsets.fromLTRB(0, 10, 0, 100),
            width: wid,
            height: hei/10,
            child: Center(
              child: Text("OR",
                style: TextStyle(
                  color: Color(0xffF4D657),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  shadows: [
                    Shadow(
                      blurRadius: 2.0,
                      color: Color(0xffF4D657),
                      offset: Offset(0, 0),
                    ),],
                ),),
            ),
          ),
          SizedBox(height: hei/25,),
          // ignore: deprecated_member_use
          FlatButton(
            height: hei/14,
            minWidth: wid-wid/14,
            onPressed: (){ widget.toggleView();},
            child: Text("SIGN UP",
              style: TextStyle(
                color: Color(0xff1c1c1c),
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Color(0xff1c1c1c),
                    offset: Offset(0, 0),
                  ),],
              ),),
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            color: Color(0xffF4D657),
          ),
          SizedBox(height: hei/17,),
        ],
      ),
    );
  }
}
