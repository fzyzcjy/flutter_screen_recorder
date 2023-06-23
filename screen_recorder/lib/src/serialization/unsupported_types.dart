import 'dart:ui';

import 'package:flutter/material.dart' as material;
import 'package:screen_recorder/src/placeholder_data.dart';
import 'package:screen_recorder/src/serialization/context.dart';

Image fromBytesImage(ContextBytesReader reader) => PlaceholderData.instance.placeholderImage;

void toBytesImage(ContextBytesWriter writer, Image value) {}

Vertices fromBytesVertices(ContextBytesReader reader) =>
    // dummy (empty) vertices
    Vertices(VertexMode.triangles, []);

void toBytesVertices(ContextBytesWriter writer, Vertices value) {}

ColorFilter fromBytesColorFilter(ContextBytesReader reader) =>
    // identity ColorFilter
    const ColorFilter.matrix([1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]);

void toBytesColorFilter(ContextBytesWriter writer, ColorFilter value) {}

ImageFilter fromBytesImageFilter(ContextBytesReader reader) =>
    // identity filter
    ImageFilter.matrix(material.Matrix4.identity().storage);

void toBytesImageFilter(ContextBytesWriter writer, ImageFilter value) {}

Shader fromBytesShader(ContextBytesReader reader) =>
    // dummy shader
    Gradient.radial(Offset.zero, 50, [material.Colors.red, material.Colors.blue]);

void toBytesShader(ContextBytesWriter writer, Shader value) {}
