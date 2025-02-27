import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrScreen extends StatefulWidget {
  @override
  _GenerateQrScreenState createState() => _GenerateQrScreenState();
}

class _GenerateQrScreenState extends State<GenerateQrScreen> {
  TextEditingController _controller = TextEditingController();

  QrImageView? _qrImageView;

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
          "Generate QR Code",
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

                  setState(() {
                    _qrImageView = QrImageView(
                      data: _controller.text,
                      version: QrVersions.auto,
                      size: 200.0,
                    );
                  });
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
              if (_qrImageView != null)
                Container(
                  color: Colors.white,
                  child: _qrImageView!,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
