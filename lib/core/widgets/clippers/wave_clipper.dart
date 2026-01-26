import 'package:flutter/material.dart';

/// A custom clipper that creates a wave shape at the bottom of the widget.
///
/// The wave consists of a smooth sine-like curve that can be customized
/// by adjusting the [waveHeight] parameter.
class WaveClipper extends CustomClipper<Path> {
  /// The height of the wave from peak to trough.
  final double waveHeight;

  /// Creates a [WaveClipper] with the specified wave height.
  ///
  /// [waveHeight] defaults to 30.0 if not specified.
  const WaveClipper({this.waveHeight = 30.0});

  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top-left
    path.lineTo(0, 0);

    // Line down to where the wave starts (left side)
    path.lineTo(0, size.height - waveHeight);

    // Create the wave using quadratic bezier curves
    // First curve (going down)
    path.quadraticBezierTo(
      size.width * 0.25, // Control point x
      size.height + waveHeight * 0.5, // Control point y (below the line)
      size.width * 0.5, // End point x
      size.height - waveHeight, // End point y
    );

    // Second curve (going up and then down)
    path.quadraticBezierTo(
      size.width * 0.75, // Control point x
      size.height - waveHeight * 2.5, // Control point y (above the line)
      size.width, // End point x
      size.height - waveHeight, // End point y
    );

    // Line to top-right corner
    path.lineTo(size.width, 88);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant WaveClipper oldClipper) {
    return oldClipper.waveHeight != waveHeight;
  }
}

/// A wave clipper that creates a smooth single wave at the bottom.
class SmoothWaveClipper extends CustomClipper<Path> {
  /// The depth of the wave curve.
  final double waveDepth;

  const SmoothWaveClipper({this.waveDepth = 35.0});

  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top-left
    path.moveTo(0, 0);

    // Line to top-right
    path.lineTo(size.width, 0);

    // Line down right side
    path.lineTo(size.width, size.height - waveDepth);

    // Create smooth wave using cubic bezier
    path.cubicTo(
      size.width * 0.75,
      size.height, // First control point
      size.width * 0.25,
      size.height - waveDepth * 2, // Second control point
      0,
      size.height - waveDepth, // End point
    );

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant SmoothWaveClipper oldClipper) {
    return oldClipper.waveDepth != waveDepth;
  }
}

/// A wave clipper that creates multiple small waves at the bottom.
class MultiWaveClipper extends CustomClipper<Path> {
  /// The height of each wave.
  final double waveHeight;

  /// Number of waves to create.
  final int waveCount;

  const MultiWaveClipper({this.waveHeight = 20.0, this.waveCount = 3});

  @override
  Path getClip(Size size) {
    final path = Path();
    final waveWidth = size.width / waveCount;

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - waveHeight);

    // Create multiple waves from right to left
    for (int i = waveCount; i > 0; i--) {
      final startX = waveWidth * i;
      final endX = waveWidth * (i - 1);
      final midX = (startX + endX) / 2;

      path.quadraticBezierTo(midX, size.height, endX, size.height - waveHeight);
    }

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant MultiWaveClipper oldClipper) {
    return oldClipper.waveHeight != waveHeight ||
        oldClipper.waveCount != waveCount;
  }
}

/// A clipper that creates a sloped shape with the left side going down.
/// The right side stays at full height while the left side slopes downward.
class SlopedLeftClipper extends CustomClipper<Path> {
  /// How much the left side slopes down from the right.
  final double slopeHeight;

  /// The curve depth at the bottom edge.
  final double curveDepth;

  const SlopedLeftClipper({
    this.slopeHeight = 60.0,
    this.curveDepth = 25.0,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top-left (sloped down)
    path.moveTo(0, slopeHeight);

    // Line to top-right (full height)
    path.lineTo(size.width, 0);

    // Line down right side
    path.lineTo(size.width, size.height - curveDepth);

    // Create a smooth curved bottom edge that slopes from right to left
    path.cubicTo(
      size.width * 0.7,
      size.height, // First control point - curves down
      size.width * 0.3,
      size.height - curveDepth * 1.5, // Second control point - curves up
      0,
      size.height - curveDepth + slopeHeight * 0.3, // End point - left side lower
    );

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant SlopedLeftClipper oldClipper) {
    return oldClipper.slopeHeight != slopeHeight ||
        oldClipper.curveDepth != curveDepth;
  }
}
