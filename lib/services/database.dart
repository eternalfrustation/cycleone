import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycleone/models/stand.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DB {
  final String? uid;
  DB({this.uid});

  // collection references, collection = table, document = element/row
  final CollectionReference standsInstance =
      FirebaseFirestore.instance.collection('Stands');
  final CollectionReference usersInstance =
      FirebaseFirestore.instance.collection('Users');

  Future updateStandData(String name, int id, Map status) async {
    return await standsInstance.doc(uid).set({
      'name': name,
      'id': id,
      'status': status,
    });
  }

  Future updateUserData(
      {String? name,
      String? email,
      String? rollNo,
      String? blacklist,
      String? cycleInPossession}) async {
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
  List<Stand> _standListFromSnapshot(QuerySnapshot snapshot) {
    final stands = snapshot.docs.map((doc) {
      log(doc.toString());
      return Stand(
        name: doc['name'],
        macAddress: "",
      );
    }).toList();
    return stands;
  }

  Stream<List<Stand>?> get standStream {
    log(standsInstance.toString());
    return standsInstance.snapshots().map(_standListFromSnapshot);
  }
}
