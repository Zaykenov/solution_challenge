import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gapSize;
  final double dashSize;

  DottedLinePainter(
      {required this.color,
      required this.strokeWidth,
      required this.gapSize,
      required this.dashSize});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startX = 0;
    double endX = size.width;

    while (startX < endX) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashSize, 0),
        paint,
      );
      startX += dashSize + gapSize;
    }
  }

  @override
  bool shouldRepaint(DottedLinePainter oldDelegate) => false;
}