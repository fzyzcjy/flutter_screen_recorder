import 'package:flutter/material.dart';

class AppLifecycleStateListener extends ValueNotifier<AppLifecycleState> {
  late final _observer = _MyAppLifecycleStateObserver(this);

  AppLifecycleStateListener() : super(AppLifecycleState.resumed) {
    WidgetsBinding.instance.addObserver(_observer);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_observer);
    super.dispose();
  }
}

class _MyAppLifecycleStateObserver extends WidgetsBindingObserver {
  final AppLifecycleStateListener _parent;

  _MyAppLifecycleStateObserver(this._parent);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) => _parent.value = state;
}
