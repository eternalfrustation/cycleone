import 'package:cycleone/models/stand.dart';
import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';

const textInputDecor = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 1.0),
  ),
);

var alert = AlertDialog(
  title: const Text('Alert'),
  content: const Text('Your WiFi is not enabled'),
  actions: [
    ElevatedButton(
      onPressed: () {
        return;
      },
      child: const Text('Cancel'),
    ),
    ElevatedButton(
      onPressed: () {
        WiFiForIoTPlugin.setEnabled(true, shouldOpenSettings: true);
      },
      child: const Text('Go To Settings'),
    ),
  ],
  elevation: 24.0,
);

var stand_cycle = Center(
    child: AlertDialog(
        title: Text("Stand 1"),
        content: const Text('Click to Unlock'),
        actions: [
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: IconButton(
                  onPressed: () {},
                  color: Colors.green,
                  icon: Icon(Icons.pedal_bike_rounded),
                  iconSize: 50.0,
                ),
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text("Unlock Cycle 1"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: IconButton(
                  onPressed: () {},
                  color: Colors.green,
                  icon: Icon(Icons.pedal_bike_rounded),
                  iconSize: 50.0,
                ),
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text("Unlock Cycle 2"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: IconButton(
                  onPressed: () {},
                  color: Colors.green,
                  icon: Icon(Icons.pedal_bike_rounded),
                  iconSize: 50.0,
                ),
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text("Unlock Cycle 3"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: IconButton(
                  onPressed: () {},
                  color: Colors.green,
                  icon: Icon(Icons.pedal_bike_rounded),
                  iconSize: 50.0,
                ),
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text("Unlock Cycle 4"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: IconButton(
                  onPressed: () {},
                  color: Colors.green,
                  icon: Icon(Icons.pedal_bike_rounded),
                  iconSize: 50.0,
                ),
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text("Unlock Cycle 5"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: IconButton(
                  onPressed: () {},
                  color: Colors.green,
                  icon: Icon(Icons.pedal_bike_rounded),
                  iconSize: 50.0,
                ),
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text("Unlock Cycle 6"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: IconButton(
                  onPressed: () {},
                  color: Colors.green,
                  icon: Icon(Icons.pedal_bike_rounded),
                  iconSize: 50.0,
                ),
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text("Unlock Cycle 7"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: IconButton(
                  onPressed: () {},
                  color: Colors.green,
                  icon: Icon(Icons.pedal_bike_rounded),
                  iconSize: 50.0,
                ),
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text("Unlock Cycle 8"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ))
            ],
          ),
        ],
      )
    ]));
