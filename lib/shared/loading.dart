import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Image(
          width: 160.0,
          height: 160.0,
          image:  AssetImage('assets/bike-biking.gif'),
        ),
      ),
    );
  }
}