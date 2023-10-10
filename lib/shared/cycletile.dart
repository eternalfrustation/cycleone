// ignore_for_file: prefer_const_constructors

import 'package:cycleone/shared/expandedcycletile.dart';
import 'package:flutter/material.dart';
import '../models/stand.dart';
import 'loading.dart';

class CycleTile extends StatefulWidget {
  final Stand stand;
  final String uid;
  const CycleTile({super.key, required this.stand, required this.uid});
  @override
  State<CycleTile> createState() => _CycleTileState();
}

class _CycleTileState extends State<CycleTile> {
  late String uid = widget.uid;
  bool loading = false;
  bool connected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.stand.name,
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
                SizedBox(
                  width: 25,
                ),
                Spacer(),
                loading
                    ? TextButton.icon(
                        onPressed: () async {
                          setState(() {
                            loading = false;
                          });
                        },
                        icon: LoadingCircle(),
                        label: Text(
                          'cancel',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : TextButton.icon(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                        },
                        icon: Icon(Icons.wifi_find_sharp),
                        label: Text('Connect to Stand'),
                      ),
                SizedBox(
                  width: 20.0,
                )
              ],
            ),
            connected
                ? ExpandedCycleTile(stand: widget.stand, uid: uid)
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "connect to stand to view options",
                      style: TextStyle(
                          color: Colors.blueGrey, fontStyle: FontStyle.italic),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
