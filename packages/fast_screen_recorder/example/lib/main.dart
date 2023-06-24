import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:fast_screen_recorder/fast_screen_recorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _recorder = FastScreenRecorder.instance;

  String? path;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            ListTile(
              title: const Text('Path'),
              subtitle: Text(path ?? 'null'),
            ),
            ListTile(
              title: const Text('Start'),
              onTap: () async {
                final dir = await getDownloadsDirectory();
                setState(() => path =
                    '${dir!.path}/${DateTime.now().toIso8601String().replaceAll(".", "").replaceAll(":", "")}.mp4');

                await _recorder.start(
                  path: File(path!),
                  outputSize: const Size(360, 720),
                  fps: 2,
                  bitrate: 80 * 1000,
                  iFrameInterval: 10,
                );
              },
            ),
            ListTile(
              title: const Text('Stop'),
              onTap: () async {
                await _recorder.stop();
              },
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text('Item $index'),
                  subtitle: Text('Random text ${Random().nextInt(1000000000)}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
