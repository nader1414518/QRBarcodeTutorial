import 'package:flutter/material.dart';
import 'package:qr_barcode_tutorial/screens/barcode/generate_barcode_screen.dart';
import 'package:qr_barcode_tutorial/screens/barcode/scan_barcode_screen.dart';
import 'package:qr_barcode_tutorial/screens/qr/generate_qr_screen.dart';
import 'package:qr_barcode_tutorial/screens/qr/scan_qr_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "QR/Barcode Tutorial",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: (MediaQuery.sizeOf(context).width) * 0.9,
                child: const Text(
                  "Select what you want to do..",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return GenerateQrScreen();
                      },
                    ),
                  );
                },
                label: const Text(
                  "Generate QR Code",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return GenerateBarcodeScreen();
                      },
                    ),
                  );
                },
                label: const Text(
                  "Generate Barcode",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ScanQrScreen();
                      },
                    ),
                  );
                },
                label: const Text(
                  "Scan QR Code",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ScanBarcodeScreen();
                      },
                    ),
                  );
                },
                label: const Text(
                  "Scan Barcode",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
