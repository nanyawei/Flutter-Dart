import 'package:flutter/material.dart';

class ScanPainter extends CustomPainter {
  final double value;
  final Color borderColor;
  final Color scanColor;

  ScanPainter(this.value, this.borderColor, this.scanColor);

  Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    if (_paint == null) {
      initPaint();
    }
    canvas.drawColor(Color.fromRGBO(0, 0, 0, 0.7), BlendMode.darken);

    double width = size.width;
    double height = size.height;

    double boxWidth = size.width * 2 / 3;
    double boxHeight = height / 3;

    double left = (width - boxWidth) / 2;
    double top = boxHeight / 2;
    double bottom = boxHeight * 1.5;
    double right = left + boxWidth;
    _paint.color = borderColor;
    final rect = Rect.fromLTWH(left, top, boxWidth, boxHeight);
    canvas.drawRect(rect, _paint);

    _paint.strokeWidth = 3;

    Path path1 = Path()
      ..moveTo(left, top + 10)
      ..lineTo(left, top)
      ..lineTo(left + 10, top);
    canvas.drawPath(path1, _paint);
    Path path2 = Path()
      ..moveTo(left, bottom - 10)
      ..lineTo(left, bottom)
      ..lineTo(left + 10, bottom);
    canvas.drawPath(path2, _paint);
    Path path3 = Path()
      ..moveTo(right, bottom - 10)
      ..lineTo(right, bottom)
      ..lineTo(right - 10, bottom);
    canvas.drawPath(path3, _paint);
    Path path4 = Path()
      ..moveTo(right, top + 10)
      ..lineTo(right, top)
      ..lineTo(right - 10, top);
    canvas.drawPath(path4, _paint);

    _paint.color = scanColor;

    final scanRect = Rect.fromLTWH(left + 5, top + 10 + (value * (boxHeight - 20)), boxWidth - 5, 1);

    _paint.shader = LinearGradient(colors: <Color>[
      // Colors.white54,
      // Colors.white,
      // Colors.white54,
      Colors.white12,
      Colors.white54,
      Colors.white,
      Colors.white54,
      Colors.white12,
    ], stops: [
      0.0,
      0.3,
      0.5,
      0.8,
      1,
    ]).createShader(scanRect);
    canvas.drawRect(scanRect, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void initPaint() {
    _paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1       // 边框宽度
      ..isAntiAlias = true    //是否抗锯齿
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
  }
}