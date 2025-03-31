import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'SwiftUI & Flutter', theme: ThemeData(primarySwatch: Colors.blue), home: const NewHome());
  }
}

class NewHome extends StatelessWidget {
  const NewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Esta es una pantalla en Flutter para futuras implementaciones",
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      ),
    );
  }
}
