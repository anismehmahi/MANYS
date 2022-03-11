import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koko/Services/auth.dart';
import 'package:koko/shared/loading.dart';

class Registre extends StatefulWidget {
  Function toggleView;
  Registre({this.toggleView});
  @override
  _RegistreState createState() => _RegistreState();
}

class _RegistreState extends State<Registre> {
  final  AuthService _auth=AuthService();
  final _formkey=GlobalKey<FormState>();
  bool loading=false;
  bool passwordVisible=false;
  String email='';
  String username="";
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    return loading? Loading():Scaffold(
      //resizeToAvoidBottomInset: true,
     // resizeToAvoidBottomInset:false,
      backgroundColor:Color(0xfff4d657),
      body: Stack(
        children: [
         Positioned(
            width: wid,
            height: hei/3-40,
            child: Column(
              children: [
                SizedBox(height: hei/10,),
                Container(
                  width: wid,

                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: Text("Existing User ?",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Color(0xff1c1c1c),
                            offset: Offset(0, 0),
                          ),],
                        fontSize: 14,
                      ),),
                  ),
                ),
                SizedBox(height :hei/40),
                // ignore: deprecated_member_use
                FlatButton(
                  height: hei/14,
                  minWidth: wid-wid/14,
                  onPressed: (){ widget.toggleView();},
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
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Positioned(
                bottom: -100,
                left: -100,
                right: -100,
                child: Center(
                  child: Container(
                    width: wid+200,
                    height: hei-(hei/3)+140,
                    decoration: BoxDecoration(
                      color: Color(0xff1c1c1c),
                      borderRadius: BorderRadius.circular(1800),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: hei/8,),
                        Container(
                          width: wid,
                          child: Padding(
                            padding:EdgeInsets.fromLTRB(15, 20, 0, 0),
                            child: Text('Sign up with',
                              style: TextStyle(
                                color:  Color(0xffF4D657),

                                fontSize: 14,
                              ),), ),
                        ),
                        Container(
                          width: wid,
                          child: Padding(
                            padding:EdgeInsets.fromLTRB(15, 5, 0, 0),
                            child: Text('MANYS TRACKER',
                              style: TextStyle(
                                color:  Color(0xffF4D657),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),), ),
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
                                  onChanged: (val) => {
                                    setState(()=>{username=val}),
                                  },
                                 // validator: (val)=>val.isEmpty? 'Enter username ':null,
                                  style: TextStyle(color: Color(0xffd3b53f)),
                                  decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.red, width: 2),),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.black, width: 2),),
                                    hintText: 'Enter Username',
                                    prefixIcon: Icon(Icons.person, color: Color(0xffd3b53f),),
                                    hintStyle: TextStyle(color: Color(0xffd3b53f),
                                        fontSize: 13.0),
                                    filled: true,
                                    fillColor: Color(0xff353535),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Color(0xff353535), width: 2),),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.black, width: 2),),
                                  ),
                                ),
                              ),
                              SizedBox(height: hei/30,),
                              Container(
                                width: wid-wid/14,
                                height: hei/14,
                                child: TextFormField(
                                  style: TextStyle(color: Color(0xffd3b53f)),

                               //   validator: (val)=>val.isEmpty? 'Enter an email ':null,
                                  onChanged: (val) => {
                                    setState(()=>{email=val}),
                                  },
                                  decoration: InputDecoration(
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.black, width: 2),),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.red, width: 2),),
                                    hintText: 'Enter Email',
                                    prefixIcon: Icon(Icons.email, color: Color(0xffd3b53f),),
                                    hintStyle: TextStyle(color: Color(0xffd3b53f),
                                        fontSize: 13.0),
                                    filled: true,
                                    fillColor: Color(0xff353535),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Color(0xff353535), width: 2),),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.black, width: 2),),
                                  ),
                                ),
                              ),
                              SizedBox(height: hei/30,),
                              Container(
                                width: wid-wid/14,
                                height: hei/14,
                                child: TextFormField(
                                  style: TextStyle(color: Color(0xffd3b53f)),
                                 // validator: (val)=>val.length<6? 'password too short ':null,
                                  obscureText: passwordVisible? false :true,

                                  onChanged: (val) => {
                                    setState(()=>{password=val}),
                                  },
                                  decoration: InputDecoration(
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.black, width: 2),),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.red, width: 2),),
                                    hintText: 'Password',
                                    prefixIcon: Icon(Icons.lock, color: Color(0xffd3b53f),),
                                    hintStyle: TextStyle(color: Color(0xffd3b53f),
                                        fontSize: 13.0),
                                    filled: true,
                                    fillColor: Color(0xff353535),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Color(0xff353535), width: 2),),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(color: Colors.black, width: 2),),
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
                              SizedBox(height: hei/20,),
                              // ignore: deprecated_member_use
                              FlatButton(
                                height: hei/14,
                                minWidth: wid-wid/14,
                                onPressed: () async {
                                  if(username==''){
                                    ScaffoldMessenger.of(context).showSnackBar(     SnackBar(

                                      content: Text('Missing Username Field',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                  else if (email==''){
                                    ScaffoldMessenger.of(context).showSnackBar(     SnackBar(

                                      content: Text('Missing Email Field',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                  else if (password==''){
                                    ScaffoldMessenger.of(context).showSnackBar(     SnackBar(

                                      content: Text('Missing password Field',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                  else{
                                  if(_formkey.currentState.validate()) {
                                    setState(() {
                                      loading=true;
                                    });
    // onPressed: (){
    // auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_){
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VerifyScreen()));
    // });
          //                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VerifyScreen()));
                                    dynamic result=await _auth.registreWithEmailAndPassword(username,email,password);/*.then((_p){
                                      print('hello');
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VerifyScreen()));});*/

                                    if(result==null){
                                      setState(() {
                                        loading=false;
                                        ScaffoldMessenger.of(context).showSnackBar(     SnackBar(

                                          content: Text('Wrong email ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),),
                                          backgroundColor: Colors.red,
                                        ));
                                        error="please enter a valid email";
                                      });
                                    }
                                  }}
                                },
                                child: Text("SIGN UP",
                                  style: TextStyle(
                                    color: Color(0xff1c1c1c),
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 2.0,
                                        color: Color(0xff1c1c1c1),
                                        offset: Offset(0, 0),
                                      ),],
                                  ),),
                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                color: Color(0xffF4D657),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),)
            ],
          ),
        ],
      ),
    );
  }
}
