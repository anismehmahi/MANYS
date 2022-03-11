import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:Colors.black,// Color(0xff353535),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          width: wid > 800 ? wid*0.4:wid*0.7,
           height: hei*0.7,
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
          child: Column(

            mainAxisAlignment:MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
             //   color: Color(0xff1c1c1c),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Reset Password',
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
              SizedBox(height: 10,),
              Container(child: Image.asset("assets/reset.png"),
              width: wid/1.2,
              height: hei/5,),
              SizedBox(height: hei/20,),
              Container(
                width: 340,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  style: TextStyle(color: Color(0xffd3b53f)),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Color(0xaaF4D657),),
                    hintStyle: TextStyle(color: Color(0xbbF4D657),
                        fontSize: 13.0),
                    hintText: "Enter Email",
                    filled: true,
                    fillColor:    Color(0xff353535),
                    enabledBorder: OutlineInputBorder(
                    //  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color:  Color(0xff353535), width: 2),),
                    focusedBorder: OutlineInputBorder(
                 //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Color(0xff1c1c1c), width: 2),),

                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),
              SizedBox(height: hei/30,),
              Container(

                child: Text("Enter your email and we will sent you a link to reset your password ",
                textAlign: TextAlign.center,
                style: TextStyle( color: Color(0xffd3b53f),
                  letterSpacing: 0.5,
                  fontSize: 14,
                  shadows: [
                    Shadow(
                      blurRadius: 1.0,
                      color: Color(0xff353535),
                      offset: Offset(0, 0),
                    ),],
                ),),
                width: 340,
              ),
              SizedBox(height: hei/20,),
                  // ignore: deprecated_member_use
              Container(
                    height: hei/16,
                    width: 100,
                    child: RaisedButton(

                      child: Text('Send',
                        style: TextStyle(
                          color: Color(0xffF4D657),
                          letterSpacing: 1.5,
                         // fontWeight: FontWeight.bold,
                          fontSize: 18,
                          shadows: [
                            Shadow(
                              blurRadius: 0.5,
                              color: Color(0xffd3b53f),
                              offset: Offset(0, 0),
                            ),],
                        ),),
                      onPressed: () async {

                        try{
                          await auth.sendPasswordResetEmail(email: _email);
                          ScaffoldMessenger.of(context).showSnackBar(     SnackBar(

                            content: Text('An email has been sent to you...',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),),
                            backgroundColor: Colors.green,
                          ));
                        Navigator.of(context).pop();}
                        catch (e){
                          ScaffoldMessenger.of(context).showSnackBar(     SnackBar(

                            content: Text('An error has been occured, verify your email spelling or try again later...',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
               //       shape: ,
                      color: Color(0xff353535),
                    ),
                  ),
              SizedBox(height: 15,)
            ],),
        ),
      ),
    );
  }
}









//For mobile
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class ResetScreen extends StatefulWidget {
//   @override
//   _ResetScreenState createState() => _ResetScreenState();
// }
//
// class _ResetScreenState extends State<ResetScreen> {
//   String _email;
//   final auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     double wid = MediaQuery.of(context).size.width;
//     double hei = MediaQuery.of(context).size.height;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Color(0xff353535),
//       appBar: AppBar(
//         backgroundColor: Color(0xff1c1c1c),
//         title: Text('Reset Password',
//           style: TextStyle(
//             color: Color(0xffF4D657),
//             letterSpacing: 1.5,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//             shadows: [
//               Shadow(
//                 blurRadius: 2.0,
//                 color: Color(0xffF4D657),
//                 offset: Offset(0, 0),
//               ),],
//           ),),
//         centerTitle: true,
//       ),
//
//       body: Column(
//         children: [
//           SizedBox(height: hei/12,),
//           Container(child: Image.asset("assets/reset.png"),
//             width: wid/1.2,
//             height: hei/5,),
//           SizedBox(height: hei/20,),
//           Padding(
//             padding: const EdgeInsets.all(3.0),
//             child: TextField(
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.email, color: Color(0xaaF4D657),),
//                 hintStyle: TextStyle(color: Color(0xbbF4D657),
//                     fontSize: 13.0),
//                 hintText: "Enter Email",
//                 filled: true,
//                 fillColor: Color(0xaa656565),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                   borderSide: BorderSide(color:  Color(0xff353535), width: 2),),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                   borderSide: BorderSide(color: Color(0xff1c1c1c), width: 2),),
//
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _email = value.trim();
//                 });
//               },
//             ),
//           ),
//           SizedBox(height: hei/30,),
//           Container(child: Text("Enter your email and we will sent you a link to reset your password ",
//             textAlign: TextAlign.center,
//             style: TextStyle( color: Color(0xffd3b53f),
//               letterSpacing: 1,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               shadows: [
//                 Shadow(
//                   blurRadius: 1.0,
//                   color: Color(0xff353535),
//                   offset: Offset(0, 0),
//                 ),],
//             ),),
//             width: wid/2,
//           ),
//           SizedBox(height: hei/15,),
//
//           // ignore: deprecated_member_use
//           Container(
//             height: hei/15,
//             width: wid/2,
//             child: RaisedButton(
//
//               child: Text('Send',
//                 style: TextStyle(
//                   color: Color(0xffF4D657),
//                   letterSpacing: 1.5,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                   shadows: [
//                     Shadow(
//                       blurRadius: 2.0,
//                       color: Color(0xffF4D657),
//                       offset: Offset(0, 0),
//                     ),],
//                 ),),
//               onPressed: () async {
//                 await auth.sendPasswordResetEmail(email: _email);
//                 Navigator.of(context).pop();
//               },
//               shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
//               color: Color(0xff1c1c1c),
//             ),
//           ),
//         ],),
//     );
//   }
// }