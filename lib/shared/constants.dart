import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';

const textInputDecor =  
InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
  ),
  focusedBorder:  OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 1.0),
  ),
);

var alert =
AlertDialog(
  title: const Text('Alert'),
  content: const Text('Your WiFi is not enabled'),
  actions: [
    ElevatedButton(
      onPressed: (){},
      child: const Text('Cancel'),
    ),
    ElevatedButton(
      onPressed: () {
        WiFiForIoTPlugin.setEnabled(false);
      },
      child: const Text('Go To Settings'),
    ),
  ],
  elevation: 24.0,
);