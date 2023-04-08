// ignore_for_file: prefer_const_constructors

import 'package:cycleone/shared/constants.dart';
import 'package:flutter/material.dart';
import '../models/stand.dart';
import 'package:wifi_iot/wifi_iot.dart';

class CycleTile extends StatelessWidget {

  final Stand? stand;
  const CycleTile({super.key, required this.stand});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20,),
                Text(
                  stand!.name, 
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
                      child: Text("Cycles: ${stand!.fulls}",
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
                      child: Text("Parking Spots: ${stand!.emptys}",
                        style: TextStyle(
                          color: Colors.blueGrey, 
                          fontSize: 15,
                        )
                      ),
                    )
                  ],
                ),
                Spacer(),
                TextButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => alert,);
                  },
                  icon: Icon(Icons.wifi_find_sharp),
                  label: Text('Connect to Stand'),
                ),
                SizedBox(width: 20.0,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}