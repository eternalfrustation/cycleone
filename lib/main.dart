// ignore_for_file: prefer_const_constructors

import 'package:cycleone/screens/wrapper.dart';
import 'package:cycleone/services/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/customuser.dart';
import 'package:wifi_iot/wifi_iot.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser?>.value(
      value: AuthService().userStream,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
