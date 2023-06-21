import 'package:flutter/material.dart';
import 'package:screen_recorder/render_screen_player.dart';

class ScreenPlayerWidget extends StatefulWidget {
  final Widget child;

  const ScreenPlayerWidget({super.key, required this.child});

  @override
  State<ScreenPlayerWidget> createState() => _ScreenPlayerWidgetState();
}

class _ScreenPlayerWidgetState extends State<ScreenPlayerWidget> {
  var enable = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          enable
              // use RepaintBoundary to ensure paint() gets offset=zero to ease programming
              ? const RepaintBoundary(
                  child: ScreenPlayerInnerWidget(),
                )
              : widget.child,
          Positioned(
            right: 48,
            bottom: 48,
            child: FloatingActionButton(
              onPressed: () => setState(() => enable = !enable),
              child: const Icon(Icons.bug_report_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
