import 'package:flutter/material.dart';

class LinearPercentIndicator extends StatefulWidget {
  final double percent;

  final double lineHeight;

  final Color fillColor;

  Color get progressColor => _progressColor;

  late final Color _progressColor;

  final Radius? barRadius;

  final bool addAutomaticKeepAlive;

  LinearPercentIndicator({
    super.key,
    this.fillColor = Colors.transparent,
    this.percent = 0.0,
    this.lineHeight = 5.0,
    Color? progressColor,
    this.addAutomaticKeepAlive = true,
    this.barRadius,
  }) {
    _progressColor = progressColor ?? Colors.red;
  }

  @override
  State<LinearPercentIndicator> createState() => _LinearPercentIndicatorState();
}

class _LinearPercentIndicatorState extends State<LinearPercentIndicator>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  double _percent = 0.0;
  final _containerKey = GlobalKey();

  @override
  void initState() {
    _updateProgress();
    super.initState();
  }

  @override
  void didUpdateWidget(LinearPercentIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percent != widget.percent) {
      _updateProgress();
    }
  }

  _updateProgress() {
    setState(() {
      _percent = widget.percent;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var items = List<Widget>.empty(growable: true);
    var containerWidget = LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: double.infinity,
          height: widget.lineHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                key: _containerKey,
                painter: _LinearPainter(
                  progress: _percent,
                  progressColor: widget.progressColor,
                  backgroundColor: Colors.transparent,
                  barRadius: widget.barRadius ?? Radius.zero,
                ),
                child: Container(),
              ),
            ],
          ),
        );
      },
    );

    items.add(
      Expanded(
        child: containerWidget,
      ),
    );

    return Material(
      color: Colors.transparent,
      child: Container(
        color: widget.fillColor,
        child: Row(
          children: items,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => widget.addAutomaticKeepAlive;
}

class _LinearPainter extends CustomPainter {
  final Paint _paintBackground = Paint();
  final Paint _paintLine = Paint();
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final Radius barRadius;

  _LinearPainter({
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
    required this.barRadius,
  }) {
    _paintBackground.color = backgroundColor;

    _paintLine.color =
        progress == 0 ? progressColor.withOpacity(0.0) : progressColor;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path borderPath = Path();
    Paint paintBorder = Paint();
    paintBorder.color = progressColor;
    borderPath.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        barRadius,
      ),
    );
    canvas.drawPath(borderPath, paintBorder);
    canvas.clipPath(borderPath);

    Path borderPathBackground = Path();
    Paint paintBorderBackground = Paint();
    paintBorderBackground.color = Colors.white;
    borderPathBackground.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(1, 1, size.width - 2, size.height - 2),
        barRadius,
      ),
    );
    canvas.drawPath(borderPathBackground, paintBorderBackground);
    canvas.clipPath(borderPathBackground);

    Path backgroundPath = Path();
    backgroundPath.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        barRadius,
      ),
    );

    canvas.drawPath(backgroundPath, _paintBackground);
    canvas.clipPath(backgroundPath);

    final xProgress = size.width * progress;
    Path linePath = Path();
    double factor = 0;
    double correction = factor * 2;

    linePath.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          factor,
          factor,
          xProgress - correction,
          size.height - correction,
        ),
        barRadius,
      ),
    );
    canvas.drawPath(linePath, _paintLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
