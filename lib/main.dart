import 'package:flutter/material.dart';
import 'package:flutterparallax/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'timesBold',
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
