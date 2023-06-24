import 'package:flutter/material.dart';
import 'package:screen_recorder/screen_recorder.dart';
import 'package:screen_recorder/screen_recorder_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenRecorder.instance.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenRecorderWidget(
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello,\n(newline) world!',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.green),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: const Text('Some BoxDecoration'),
            ),
            const SizedBox(
              width: 128,
              child: TextField(),
            ),
          ],
        ),
      ),
    );
  }
}
