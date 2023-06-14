import 'dart:developer';

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
          id: doc['id'],
          lockStatus: List<bool>.from(doc['status']),
          ip: doc['ip'],
          ssid: doc['ssid'],
          password: doc['password']);
    }).toList();
    return stands;
  }

  Future sendLockRequest(int standId, int cycleId, bool lock) async {
    var stand = await DB()
        .standStream
        .map((stands) =>
            stands!.where((stand) => stand.id == standId).firstOrNull)
        .first;
    var status = stand!.lockStatus;
    status[cycleId] = lock;
    await usersInstance.doc(uid).update({'cycleInPossession': true});
    return await standsInstance.doc(uid).update({'status': status});
  }

  Stream<List<Stand>?> get standStream {
    log(standsInstance.toString());
    return standsInstance.snapshots().map(_standListFromSnapshot);
  }
}
