import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("what the fuck should i write"),
        ),
        body: Center(
          child: Container(
            child: const Text("yo yo yo yo"),
            margin: EdgeInsets.all(50),
            padding: EdgeInsets.all(30),
            color: Colors.blueGrey,
            height: 500,
          ),
        ),
      ),
    );
  }
}
