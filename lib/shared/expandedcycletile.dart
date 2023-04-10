import 'package:cycleone/services/wifi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/stand.dart';

class ExpandedCycleTile extends StatelessWidget {

  final Stand stand;
  const ExpandedCycleTile({super.key, required this.stand});

  @override
  Widget build(BuildContext context) {

    final WiFiService wiFiService = WiFiService(stand: stand);

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 400.0,
        child: ListView.builder(
          itemCount: stand.status.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.pedal_bike_rounded,
                  color: stand.status[index] == 'null' ? Colors.grey : Colors.green,
                ),
                ElevatedButton(
                  onPressed: () async {
                    //await wiFiService.sendUnlockRequest(index);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text("Unlock cycle ${index.toString()}"),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}