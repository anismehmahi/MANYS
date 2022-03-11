
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService{
  String uid;
  DataBaseService({this.uid});
  final CollectionReference userCollection=Firestore.instance.collection('Users');

  Future updateUserData(String name,String phoneToFind,bool start) async {
    // ignore: deprecated_member_use
    return await userCollection.document(uid).setData({
      'UserName':name,
      'PhoneToFind':phoneToFind,
      'Start':start,
    });
  }
}