
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:Manys/SaveUserInfo.dart';
import 'package:Manys/models/user.dart' as kk;

import 'database.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  bool google=false;
  //custom user
  kk.User _userFromFirebaseUSer(var user){
    return user==null? null:kk.User(uid:user.uid);
  }
  kk.User _userFromGoogle(GoogleSignInAccount user){
    return user==null? null:kk.User(uid:user.id);
  }

  //auth change user stream  lahna hadi ta3tina notif ida signin signout
  Stream<kk.User> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebaseUSer);
  }
  //Sign in in anon
  //Sign in with email and password
  Future signInWithEmailAndPassword(String email,String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      SaveUserInfo.id=user.uid;
      // Save in shared prefernces
      return _userFromFirebaseUSer(user);
    } on FirebaseAuthException {
      return null;
    }
  }
  // sign in with google
  //Registre
    Future registreWithEmailAndPassword(String name,String email,String password) async{
      try{
        UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
        FirebaseUser user=result.user;

        //create new document for the user with the uid
        await DataBaseService(uid: user.uid).updateUserData(name, "0", false);
        // Save in shared
        SaveUserInfo.id =  user.uid;
        return _userFromFirebaseUSer(user);
      }catch(e){
        return null;
      }
    }
  //Sign out
  Future signOut() async {
    try{
      if (google) await GoogleSignIn().signOut();
      await _auth.signOut();
      SaveUserInfo.id="";
    }catch(e){
      return null;
    }
  }
  Future<kk.User> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
    String _googleUserEmail = _googleUser.email; //BURADA GMAİL OTURUMUNDAN
    // DİREKT OLARAK MAİL ADRESİNİ ALMAYA ÇALIŞIYORUM.
    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        UserCredential sonuc = await _auth.signInWithCredential(
            GoogleAuthProvider.getCredential(
                idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken));
        FirebaseUser user = sonuc.user;
        sonuc.user.updateEmail(_googleUserEmail);
        SaveUserInfo.id=user.uid;
        // Save in shared prefs
        return _userFromFirebaseUSer(user);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}