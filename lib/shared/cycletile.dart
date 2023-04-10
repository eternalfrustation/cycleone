// ignore_for_file: prefer_const_constructors

import 'package:cycleone/services/wifi.dart';
import 'package:cycleone/shared/constants.dart';
import 'package:cycleone/shared/expandedcycletile.dart';
import 'package:flutter/material.dart';
import '../models/stand.dart';
import 'package:wifi_iot/wifi_iot.dart'; 
import 'loading.dart';

class CycleTile extends StatefulWidget {

  final Stand stand; 
  const CycleTile({super.key, required this.stand});

  @override
  State<CycleTile> createState() => _CycleTileState();
}

class _CycleTileState extends State<CycleTile> {
  
  late WiFiService wiFiService = WiFiService(stand: widget.stand);
  bool loading = false;
  bool connected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20,),
                Text(
                  widget.stand!.name, 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 25,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent[100],
                      ),
                      child: Text("Cycles: ${widget.stand.fulls}",
                        style: TextStyle(
                          color: Colors.green, 
                          fontSize: 15,
                        )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                      ),
                      child: Text("Parking Spots: ${widget.stand.emptys}",
                        style: TextStyle(
                          color: Colors.blueGrey, 
                          fontSize: 15,
                        )
                      ),
                    )
                  ],
                ),
                Spacer(),
                loading? TextButton.icon(
                  onPressed: () async {
                    setState(() {
                      loading = false;
                    });
                  },
                  icon: LoadingCircle(),
                  label: Text('cancel', style: TextStyle(color: Colors.red),),
                )
                : TextButton.icon(
                  onPressed: () async {
                    await wiFiService.connectToStand();
                    setState(() {
                      loading = true;
                    });
                  },
                  icon: Icon(Icons.wifi_find_sharp),
                  label: Text('Connect to Stand'),
                ),
                SizedBox(width: 20.0,)
              ],
            ),
            connected? ExpandedCycleTile(stand: widget.stand) 
            : Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "connect to stand to view options",
                style: TextStyle(color: Colors.blueGrey, fontStyle: FontStyle.italic),),
            ))
          ],
        ),
      ),
    );
  }
}