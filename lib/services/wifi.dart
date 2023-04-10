import 'dart:convert';

import 'package:wifi_iot/wifi_iot.dart';
import 'package:flutter/material.dart';
import 'package:cycleone/models/stand.dart'; 
import 'package:http/http.dart';

class WiFiService {

  Stand stand;
  WiFiService({required this.stand});
  bool notConfigured = true;
  bool notEnabled = true;
  bool notConnected = true;
  bool connectedToStand = false;

  Future<bool?> connectToStand() async {
    if(notConfigured) {
      await WiFiForIoTPlugin.isEnabled() ? notEnabled = false : WiFiForIoTPlugin.setEnabled(true);
      await WiFiForIoTPlugin.isConnected() ? notConnected = false : WiFiForIoTPlugin.connect(stand.ssid, timeoutInSeconds: 5);
      await WiFiForIoTPlugin.getIP() == stand.ip ? connectedToStand = true : WiFiForIoTPlugin.connect(stand.ssid, timeoutInSeconds: 5);

      if (!notEnabled && !notConnected && connectedToStand) {
        notConfigured = false;
        stand.connectedToApp = true;
        return true;
      }
      else {
        return false;
      }
    }
    return null;
  }

  Future<Response> sendUnlockRequest(int n) async {
    Response response = await post(
      Uri.parse(stand.ip), 
      body: jsonEncode({'standToUnlock': n.toString()}));
    return response;
  }

}