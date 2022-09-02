import 'package:flutter/material.dart';
import 'package:http_demoo/screens/main_Screen.dart';

void main() {
  runApp(HttpApp());
}

class HttpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    ));
  }
}
