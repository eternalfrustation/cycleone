
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycleone/models/stand.dart';
import 'package:flutter/material.dart';

class DB {

  final String? uid;
  DB({this.uid});

  // collection references, collection = table, document = element/row
  final CollectionReference standsInstance = FirebaseFirestore.instance.collection('Stands');
  final CollectionReference usersInstance = FirebaseFirestore.instance.collection('Users');

  Future updateStandData(String name, int id, Map status) async {
    return await standsInstance.doc(uid).set({
      'name': name,
      'id': id,
      'status': status,
    });
  }

  Future updateUserData({String? name, String? email, String? rollNo, String? blacklist, String? cycleInPossession}) async {
    return await usersInstance.doc(uid).set({
      'uid': uid,
      'name': name,
      'email': email,
      'rollno': rollNo,
      'blacklist': blacklist,
      'cycleInPossession': cycleInPossession,
    });
  }

  // create a list of brew preferences from the snapshot
  List<Stand>? _standListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Stand(
        name: doc['name'], 
        id: doc['id'], 
        status: doc['status'], 
        ip: doc['ip'],
        ssid: doc['ssid'],);
    }).toList();
  }

  Stream<List<Stand>?> get standStream {
    return standsInstance.snapshots().map(_standListFromSnapshot);
  }
}