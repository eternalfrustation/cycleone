import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key, required this.onMacFound});
  final Function(String?) onMacFound;

  @override
  Widget build(BuildContext context) {
    log("Built the Camera Widget");
    return Scaffold(
        body: MobileScanner(
      fit: BoxFit.contain,
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        for (final barcode in barcodes) {
          debugPrint("Found Barcode ${barcode.rawValue}");
          debugPrint(
              "Byte length of barcode: ${barcode.rawBytes?.lengthInBytes}");
          debugPrint("Raw bytes: ${barcode.rawBytes?.toString()}");
          debugPrint(": Found: ${(barcode.rawValue?.characters.where((c) {
            return c == ':';
          })).toString().length}");
          if ((barcode.rawValue?.characters.where((c) {
                return c == ':';
              })).toString().length ==
              5) {
            debugPrint(
                "Found Possible MacAdress ${barcode.rawBytes?.toString()}");
            onMacFound(barcode.rawValue);
          }
        }
      },
    ));
  }
}
