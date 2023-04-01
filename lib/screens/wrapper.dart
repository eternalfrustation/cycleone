// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/customuser.dart';
import 'authenticate.dart';
import 'home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final userData = Provider.of<CustomUser?>(context);

    if (userData == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
} 