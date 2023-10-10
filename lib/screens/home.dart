// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:developer';

import 'package:cycleone/screens/standlist.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../models/stand.dart';
import '../services/authentication.dart';
import '../services/database.dart';
import './qr_scanner.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _authservice = AuthService();
  bool isCameraOpen = false;
  Stand? connectedStand;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Stand>?>.value(
      value: DB().standStream,
      initialData: [
        Stand(
          name: 'noname',
          macAddress: "",
        )
      ],
      child: isCameraOpen
          ? QrScreen(onMacFound: (mac) async {
              debugPrint(mac.toString());
              setState(() {
                isCameraOpen = false;
              });
              Stand stand = Stand(name: "Test", macAddress: mac);
              debugPrint("Getting Permission");
              bool isBluetoothPermGranted = false;
              if (!await Permission.bluetooth.isGranted) {
                isBluetoothPermGranted =
                    (await Permission.bluetooth.request()).isGranted;
              } else {
                isBluetoothPermGranted = true;
              }
              if (isBluetoothPermGranted) {
                debugPrint("Got the permission");
                stand.connect();
                stand.unlock();
              } else {
                debugPrint("Bluetooth Permission Denied");
              }
            })
          : Scaffold(
              floatingActionButton: ElevatedButton(
                child: Text("Connect"),
                onPressed: () async {
                  bool isCameraPermGranted = false;
                  if (!await Permission.camera.isGranted) {
                    isCameraPermGranted =
                        (await Permission.camera.request()).isGranted;
                  } else {
                    isCameraPermGranted = true;
                  }
                  if (isCameraPermGranted) {
                    log("Permission Granted");
                    setState(() {
                      isCameraOpen = true;
                    });
                  } else {
                    log("Permission Not granted");
                  }
                },
              ),
              appBar: AppBar(
                title: Text("Home Page"),
                backgroundColor: Colors.black,
                actions: <Widget>[
                  OutlinedButton.icon(
                    onPressed: () {
                      _authservice.signOut();
                    },
                    icon: Icon(Icons.person),
                    label: Text("Logout"),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings),
                  )
                ],
              ),
              body: StandList(uid: _authservice.getUserId()),
            ),
    );
  }
}
