// ignore_for_file: prefer_const_constructors

import 'package:cycleone/screens/standlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/stand.dart';
import '../services/authentication.dart';
import '../services/database.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _authservice = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Stand>?>.value(
      value: DB().standStream,
      initialData: [Stand(name: 'noname', id: 0, status: [], ip: '', ssid: '')],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          backgroundColor: Colors.black,
          actions: <Widget>[
            OutlinedButton.icon(
              onPressed: () {_authservice.signOut();}, 
              icon: Icon(Icons.person), 
              label: Text("Logout"),),
            IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.settings),
            )
          ],
        ),
        body: StandList(),
      ),
    );
  }
}