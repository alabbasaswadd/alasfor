import 'package:flutter/material.dart';

/// A custom painter that draws a navigation bar with an upward arch at the top.
/// The arch curves up in the center and down to the sides.
class ArcNavBarPainter extends CustomPainter {
  /// The color of the navigation bar.
  final Color color;

  /// The height of the arch (how much it curves up).
  final double arcHeight;

  /// Whether to draw a shadow.
  final bool showShadow;

  /// The shadow color.
  final Color shadowColor;

  const ArcNavBarPainter({
    required this.color,
    this.arcHeight = 30.0,
    this.showShadow = true,
    this.shadowColor = const Color(0x33000000),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = _createPath(size);

    // Draw shadow if enabled
    if (showShadow) {
      canvas.drawShadow(path, shadowColor, 10.0, false);
    }

    // Draw the navigation bar
    canvas.drawPath(path, paint);
  }

  Path _createPath(Size size) {
    final path = Path();

    // Start from bottom-left corner
    path.moveTo(0, size.height);

    // Line up the left side to the arc start point
    path.lineTo(0, arcHeight);

    // Create the upward arch using a quadratic bezier curve
    // The arch goes UP in the center and curves down to the sides
    path.quadraticBezierTo(
      size.width / 2, // Control point X (center)
      -arcHeight * 0.5, // Control point Y (above the top, creates the arch)
      size.width, // End point X (right side)
      arcHeight, // End point Y (same height as start)
    );

    // Line down the right side
    path.lineTo(size.width, size.height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldRepaint(covariant ArcNavBarPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.arcHeight != arcHeight ||
        oldDelegate.showShadow != showShadow ||
        oldDelegate.shadowColor != shadowColor;
  }
}

/// A custom clipper that creates the upward arch shape for the navigation bar.
class ArcNavBarClipper extends CustomClipper<Path> {
  /// The height of the arch.
  final double arcHeight;

  const ArcNavBarClipper({this.arcHeight = 30.0});

  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from bottom-left corner
    path.moveTo(0, size.height);

    // Line up the left side
    path.lineTo(0, arcHeight);

    // Create the upward arch
    path.quadraticBezierTo(
      size.width / 2,
      -arcHeight * 0.5,
      size.width,
      arcHeight,
    );

    // Line down the right side
    path.lineTo(size.width, size.height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant ArcNavBarClipper oldClipper) {
    return oldClipper.arcHeight != arcHeight;
  }
}

/// A smoother arch painter with more control over the curve.
class SmoothArchPainter extends CustomPainter {
  /// The color of the navigation bar.
  final Color color;

  /// The height of the arch.
  final double arcHeight;

  /// Whether to draw a shadow.
  final bool showShadow;

  const SmoothArchPainter({
    required this.color,
    this.arcHeight = 35.0,
    this.showShadow = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start from bottom-left
    path.moveTo(0, size.height);

    // Line up left side
    path.lineTo(0, arcHeight * 1.2);

    // First curve (left side going up)
    path.cubicTo(
      size.width * 0.3,
      arcHeight * 1.8, // First control point
      size.width * 0.35,
      0, // Second control point
      size.width * 0.5,
      0, // End at top center
    );

    // Second curve (right side going down)
    path.cubicTo(
      size.width * 0.65,
      0, // First control point
      size.width * 0.8,
      arcHeight * 1.2, // Second control point
      size.width,
      arcHeight * 2.2, // End at right side
    );

    // Line down right side
    path.lineTo(size.width, size.height);

    // Close the path
    path.close();

    // Draw shadow
    if (showShadow) {
      canvas.drawShadow(path, Colors.black26, 10.0, false);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant SmoothArchPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.arcHeight != arcHeight ||
        oldDelegate.showShadow != showShadow;
  }
}
