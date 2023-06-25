class InteractionRecorder {
  void start() {
    TODO;
  }

  TODO stop() {
    TODO;
  }
}

class InteractionRecorderWidget extends StatelessWidget {
  final Widget child;

  const InteractionRecorderWidget({Key? key}) : super(key: key);

  void _handlePointer(PointerEvent e) {
    TODO;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _handlePointer,
      onPointerMove: _handlePointer,
      child: child,
    );
  }
}
