import 'dart:io';

import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class GenerateBarcodeScreen extends StatefulWidget {
  @override
  _GenerateBarcodeScreenState createState() => _GenerateBarcodeScreenState();
}

class _GenerateBarcodeScreenState extends State<GenerateBarcodeScreen> {
  TextEditingController _controller = TextEditingController();

  File? _barcodeFile;

  _buildBarcode(
    Barcode bc,
    String data, {
    String? filename,
    double? width,
    double? height,
    double? fontHeight,
  }) async {
    /// Create the Barcode
    final svg = bc.toSvg(
      data,
      width: width ?? 200,
      height: height ?? 80,
      fontHeight: fontHeight,
    );

    // Save the image
    filename ??= bc.name.replaceAll(RegExp(r'\s'), '-').toLowerCase();

    var dir = Platform.isIOS
        ? await getApplicationDocumentsDirectory()
        : await getExternalStorageDirectory();

    setState(() {
      _barcodeFile = File("${dir!.path}/$filename.svg");
    });

    _barcodeFile!.writeAsStringSync(svg);
  }

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
          "Generate Barcode",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Enter content",
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 10,
              ),
              hintText: "Content",
              labelText: "Content",
            ),
            controller: _controller,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  if (_controller.text.isEmpty) {
                    return;
                  }

                  _buildBarcode(
                    Barcode.code128(),
                    _controller.text,
                    filename: DateTime.now()
                        .toIso8601String()
                        .replaceAll(":", "")
                        .replaceAll(".", "")
                        .replaceAll(" ", "")
                        .replaceAll("T", "")
                        .replaceAll("Z", ""),
                    height: 80,
                    width: 200,
                  );
                },
                label: const Text(
                  "Generate",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_barcodeFile != null)
                Container(
                  color: Colors.white,
                  child: Image.file(
                    _barcodeFile!,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
