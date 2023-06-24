import 'dart:math';

import 'package:fast_screen_recorder/fast_screen_recorder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: FastScreenRecorderDemoWidget(
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text('Item $index'),
              subtitle: Text('Random text ${Random().nextInt(1000000000)}'),
            ),
          ),
        ),
      ),
    );
  }
}
