// import 'package:flutter/material.dart';

// class TicketClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     const notchRadius = 16.0;
//     final path = Path();

//     // Start top left
//     path.moveTo(0, 0);

//     // Top notch (center)
//     path.lineTo(size.width / 2 - notchRadius, 0);
//     path.arcToPoint(
//       Offset(size.width / 2 + notchRadius, 0),
//       radius: const Radius.circular(notchRadius),
//       clockwise: false,
//     );
//     path.lineTo(size.width, 0);

//     // Right side
//     path.lineTo(size.width, size.height);

//     // Bottom notch (center)
//     path.lineTo(size.width / 2 + notchRadius, size.height);
//     path.arcToPoint(
//       Offset(size.width / 2 - notchRadius, size.height),
//       radius: const Radius.circular(notchRadius),
//       clockwise: false,
//     );
//     path.lineTo(0, size.height);

//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
import 'dart:math';

import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const notchWidth = 33.0; // Wider
    const notchHeight = 30.0; // Shorter vertically
    final path = Path();

    path.moveTo(0, 0);

    // Top wide notch
    final topRect = Rect.fromCenter(
      center: Offset(size.width / 2, 0),
      width: notchWidth,
      height: notchHeight,
    );
    path.lineTo(size.width / 2 - notchWidth / 2, 0);
    path.arcTo(topRect, pi, -pi, false);
    path.lineTo(size.width, 0);

    // Right side
    path.lineTo(size.width, size.height);

    // Bottom wide notch
    final bottomRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height),
      width: notchWidth,
      height: notchHeight,
    );
    path.lineTo(size.width / 2 + notchWidth / 2, size.height);
    path.arcTo(bottomRect, 0, -pi, false);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
