import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class Stand {
  final String name;
  final String? macAddress;
  bool? isLocked;
  BluetoothConnection? btConn;
  String? currentTag;

  Stand({
    required this.name,
    required this.macAddress,
  });
  connect() async {
    btConn = await BluetoothConnection.toAddress(macAddress);
    btConn?.input?.listen((data) {
      final resp = jsonDecode(data as String);
      if (resp["status"] == "failed") {
        log(resp);
        if ((resp["error"] as String).contains("Not Available")) {
          isLocked == false;
        }
      } else if (resp["status"] == "success") {
        currentTag = resp["tag"];
        isLocked = true;
      }
    });
  }

  void unlock() {
    btConn?.output.add('U' as Uint8List);
  }

  void getTag() {
    btConn?.output.add('G' as Uint8List);
  }
}

class InvalidMacAddress {}
