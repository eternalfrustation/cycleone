import 'dart:developer';
import 'package:cycleone/shared/constants.dart';

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
    final DB db = DB(uid: uid);

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
          height: 200.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.pedal_bike_rounded,
                color: (stand.isLocked == false) ? Colors.grey : Colors.green,
              ),
              ElevatedButton(
                onPressed: () {
                  stand.isLocked = false;
                  log("Initializing Request\n");
                  stand.unlock();
                  stand.getTag();
                  //     db.sendLockRequest(stand.id + 1, index, true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      (stand.isLocked == false) ? Colors.grey : Colors.green,
                ),
                child: (stand.isLocked == false)
                    ? const Text("Cycle Unlocked")
                    : const Text("Unlock cycle"),
              ),
            ],
          )),
    );
  }
}
