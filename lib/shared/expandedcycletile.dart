
import 'package:cycleone/services/wifi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/stand.dart';
import '../services/database.dart';

class ExpandedCycleTile extends StatelessWidget {
  final Stand stand;
  final String uid;
  const ExpandedCycleTile({super.key, required this.stand, required this.uid});

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
                    color: (stand.lockStatus[index] == 'null' ||
                            !stand.lockStatus[index])
                        ? Colors.grey
                        : Colors.green,
                  ),
                  ElevatedButton(
                    onPressed: (stand.lockStatus[index] == 'null' ||
                            !stand.lockStatus[index])
                        ? null
                        : () async {
                            await wiFiService.sendUnlockRequest(index);
                            await db.sendLockRequest(stand.id, index, true);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (!stand.lockStatus[index])
                          ? Colors.grey
                          : Colors.green,
                    ),
                    child: (stand.lockStatus[index] == 'null' ||
                            !stand.lockStatus[index])
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
