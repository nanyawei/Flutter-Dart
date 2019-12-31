import 'package:flutter/material.dart';
import 'package:flutter_dart/component/snapshot/scan_painter.dart';

class ScanImageView extends StatefulWidget {
  final Widget child;

  const ScanImageView({Key key, this.child}) : super(key: key);

  @override
  _ScanImageViewState createState() => _ScanImageViewState();
}

class _ScanImageViewState extends State<ScanImageView>
    with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) => CustomPaint(
              foregroundPainter:
                  ScanPainter(controller.value, Colors.white, Colors.green),
              child: widget.child,
              willChange: true,
            ));
  }
}
