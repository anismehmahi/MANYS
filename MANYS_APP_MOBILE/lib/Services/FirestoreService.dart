import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../SaveUserInfo.dart';



class FirestoreService{

  Firestore conn = Firestore.instance;
  Stream<DocumentSnapshot>getStream(){
    return conn.collection("Skandar").document("Yep4t8JjQpRAVYFuUK2c").snapshots();
  }

  add()async{
    return await conn.collection("Essai").add({"name": "Skandar"});
  }

  Future<DocumentReference> addPosition(GeoPoint position){
    return conn.collection("Coordinates").add({"postion": position});
  }

  Future<DocumentReference> add2(){
    return conn.collection("Essai").add({"name": "Skandar"});
  }

  // Now a the collection 2
  getStream2(){
    return conn.collection("Essai2").snapshots();
  }

  // ______________Function
  // Remark : foroptimization you must first check if the user had already added this car or not
  Future<void> addnewCar({@required String phoneNumber,@required String carName, @required type, @required barCode}) {
    print(SaveUserInfo.id);
    return  conn.collection("Users").document(SaveUserInfo.id).collection("UserCar").add({
      "carName": carName,
      "phoneNumber": phoneNumber,
      "type":type,
      "barCode": barCode
    }, );
  }
  //
  Stream<QuerySnapshot> getUserCars(){
    return conn.collection("Users").document(SaveUserInfo.id).collection("UserCar").snapshots();
  }
  //
  Future<void> deleteCar({@required String id}){
    return conn.collection("Users").document(SaveUserInfo.id).collection("UserCar").document(id).delete();
  }
  // here the update methode
  // here the update methode
  // Remember : in the sign Up you must remember to create and initialise to false
  startTrackingCar({@required String phoneToFind}){
    return conn.collection("Users").document(SaveUserInfo.id).updateData({
      "Start": true,
      "PhoneToFind": phoneToFind,
    });
  }
  // start signal
  Stream<DocumentSnapshot> startListener(){
    return conn.collection("Users").document(SaveUserInfo.id).snapshots();
  }
  // add new historique
  Future<DocumentReference> addnewHistorique({@required String phoneToFind}){
    return conn.collection("Locations").document(phoneToFind).collection("Historiques").add({
      "Time-enre": DateTime.now()
    });
  }

  // id of document to follow
  Future<void> updateIdToFollow({@required String id}){
    return conn.collection("Locations").document(SaveUserInfo.phoneNumber).setData({
      "idOfDocToFollow": id,
    }, merge : true);
  }

  Future<DocumentReference> addLocation({@required String id,@required GeoPoint position, double heading}){
    return conn.collection("Locations").document(SaveUserInfo.phoneNumber).collection("Historiques").document(id).collection("Coordinates").add({
      "Position": position,
      "time": Timestamp.now().millisecondsSinceEpoch,
      "heading": heading,
    });
  }

  // Recuperating the last id
  Stream<DocumentSnapshot> currentId({@required String phoneToFind}){
    Stream<DocumentSnapshot> temp ;
    try{
      temp = conn.collection("Locations").document(phoneToFind).snapshots();}
    on Exception catch (exception){
      print("kkkkkkkkkkkkkkkkkkkkkkkk");
      print("${exception.toString()}");
      return null;
    } catch(error){
      print("mmmmmmmmmmmmmmmmmm");
      print("${error.toString()}");
      return null;
    }
    return temp;
  }

  Stream<QuerySnapshot> track({@required String phoneToFind, @required String id}){
    return conn.collection("Locations").document(phoneToFind).collection("Historiques").document(id).collection("Coordinates").orderBy("time").snapshots();
  }

  // StopTracknig
  Future<void> stopTracking(){
    return conn.collection("Users").document(SaveUserInfo.id).updateData({
      "Start": false,
      "PhoneToFind":""
    });
  }

  Future<void> OpenCamera({@required String phoneToFind}){
    return conn.collection("Users").document(SaveUserInfo.id).updateData({
      "Camera": true,
      "PhoneToFind":phoneToFind
    });
  }
  Future<void> CloseCamera({@required String phoneToFind}){
    return conn.collection("Users").document(SaveUserInfo.id).updateData({
      "Camera": false,
      "PhoneToFind":phoneToFind
    });
  }

  // Historiques
  Stream<QuerySnapshot> getHistory({@required String phoneToFind}){
    return conn.collection("Locations").document(phoneToFind).collection("Historiques").orderBy("Time-enre", descending : true).snapshots();
  }
  // Skandar chahbounni
  // get polyline set
  Future<QuerySnapshot> getPolylineSet({@required String phoneToFind, @required String id}){
    return conn.collection("Locations").document(phoneToFind).collection("Historiques").document(id).collection("Coordinates").orderBy("time").getDocuments();
  }
  String getId() {
    return (SaveUserInfo.id).toString();
  }
}