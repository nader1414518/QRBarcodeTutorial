import 'package:flutter/material.dart';
import 'package:qr_barcode_tutorial/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter QR/Barcode Generator/Scanner',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
