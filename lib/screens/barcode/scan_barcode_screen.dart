import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ScanBarcodeScreen extends StatefulWidget {
  @override
  _ScanBarcodeScreenState createState() => _ScanBarcodeScreenState();
}

class _ScanBarcodeScreenState extends State<ScanBarcodeScreen> {
  String _result = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Scan Barcode",
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              String? res = await SimpleBarcodeScanner.scanBarcode(
                context,
                barcodeAppBar: const BarcodeAppBar(
                  appBarTitle: 'Test',
                  centerTitle: false,
                  enableBackButton: true,
                  backButtonIcon: Icon(Icons.arrow_back_ios),
                ),
                isShowFlashIcon: true,
                delayMillis: 2000,
                cameraFace: CameraFace.front,
              );
              if (res != null) {
                setState(() {
                  _result = res;
                });
              }
            },
            child: const Text('Open Scanner'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          if (_result != "")
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width - 40) * 0.8,
                  child: Text(
                    "Data: $_result",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
