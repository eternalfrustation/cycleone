import 'dart:developer';
import 'package:cycleone/shared/constants.dart';

import 'package:cycleone/services/wifi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wifi_iot/wifi_iot.dart';
import '../models/stand.dart';
import '../services/database.dart';

class ExpandedCycleTile extends StatelessWidget {
  Stand stand;
  final String uid;
  ExpandedCycleTile({super.key, required this.stand, required this.uid});

  @override
  Widget build(BuildContext context) {
    final WiFiService wiFiService = WiFiService(stand: stand);
    final DB db = DB(uid: uid);

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 200.0,
        child: ListView.builder(
            itemCount: stand.lockStatus.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.pedal_bike_rounded,
                    color:
                        (!stand.lockStatus[index]) ? Colors.grey : Colors.green,
                  ),
                  ElevatedButton(
                    onPressed: (!stand.lockStatus[index])
                        ? null
                        : () {
                            stand.lockStatus[index] = false;
                            log("Initializing Request\n");
                            var resp = wiFiService.sendUnlockRequest(index);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: const Text("Alert"),
                                      content: const Text(
                                          "Please turn off your WiFi to proceed"),
                                      actions: [
                                        TextButton(
                                            onPressed:
                                                WiFiForIoTPlugin.setEnabled(
                                                    false,
                                                    shouldOpenSettings: true),
                                            child: const Text("Proceed")),
                                        TextButton(
                                            onPressed:
                                                WiFiForIoTPlugin.setEnabled(
                                                    false,
                                                    shouldOpenSettings: true),
                                            child: const Text("Proceed"))
                                      ]);
                                });
                            db.sendLockRequest(stand.id, index, false);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (!stand.lockStatus[index])
                          ? Colors.grey
                          : Colors.green,
                    ),
                    child: (!stand.lockStatus[index])
                        ? Text("Cycle ${index.toString()} Unlocked")
                        : Text("Unlock cycle ${index.toString()}"),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
