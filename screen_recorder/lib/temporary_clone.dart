import 'dart:typed_data';
import 'dart:ui';

import 'package:screen_recorder/expandos.dart';
import 'package:screen_recorder/replayer/canvas.dart';

// TODO only a temporary workaround, should remove after implementing serialization
extension ExtPathTemporaryClone on Path {
  Path temporaryClone() => Path.from(this);
}

extension ExtPictureTemporaryClone on Picture {
  Picture temporaryClone() => CanvasReplayer.replay(record);
}

extension ExtFloat32ListTemporaryClone on Float32List {
  Float32List temporaryClone() => Float32List.fromList(this);
}

extension ExtFloat64ListTemporaryClone on Float64List {
  Float64List temporaryClone() => Float64List.fromList(this);
}
