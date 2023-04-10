import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingCycle extends StatelessWidget {
  const LoadingCycle({super.key});

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

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const SpinKitChasingDots(
        size: 20.0,
        color: Colors.red,
      ),
    );
  }
}