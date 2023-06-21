import 'dart:ui';

mixin SceneBuilderMixin implements SceneBuilder {
  SceneBuilder get proxy;

  @override
  void addPicture(
    Offset offset,
    Picture picture, {
    bool isComplexHint = false,
    bool willChangeHint = false,
  });
}
