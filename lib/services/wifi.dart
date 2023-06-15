import 'dart:convert';
import 'dart:developer';

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
    await WiFiForIoTPlugin.setEnabled(true, shouldOpenSettings: true);
    await WiFiForIoTPlugin.connect(stand.ssid, timeoutInSeconds: 5);
    await WiFiForIoTPlugin.forceWifiUsage(true);
      /*
      await WiFiForIoTPlugin.getIP() == stand.ip
          ? connectedToStand = true
          : WiFiForIoTPlugin.connect(stand.ssid, timeoutInSeconds: 5);
*/
		/*
      if (!notEnabled && !notConnected && connectedToStand) {
        notConfigured = false;
        stand.connectedToApp = true;
        return true;
      } else {
        return false;
      }
    }*/
    return null;
  }

  String sendUnlockRequest(int n) {
    var uri = Uri(
        scheme: "http",
        host: stand.ip,
        queryParameters: {'cycleNum': n.toString()});
    log(uri.toString());
    var request = get(uri);
    log(request.toString());
    var resp = request.asStream().toString();
    log(resp);
    return resp;
  }
}
