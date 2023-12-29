import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'dart:math' as math;
class PieQuickView extends StatefulWidget {
  @override
  _PieQuickViewState createState() => _PieQuickViewState();
}

class _PieQuickViewState extends State<PieQuickView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      child: Transform.rotate(
        angle: 0,
        child: CustomPaint(
          painter: SchedulePainter(),
        ),
      ),
    );
  }
}
class SchedulePainter extends CustomPainter {
  var dateTime = DateTime.now();
  //var schedule = ScheduleData();
  //60 sec - 360, 1 sec - 6degree
  //12 hours  - 360, 1 hour - 30degrees, 1 min - 0.5degrees
  List<Color> categoryColors = [Color(0xFFFF6633), Color(0xFF33FFCC), Color(0xFFFF33FF),
  Color(0xFFFFFF99), Color(0xFF00B3E6), Color(0xFFE6B333),
  Color(0xFF3366E6), Color(0xFF999966), Color(0xFF99FF99),
  Color(0xFFB34D4D), Color(0xFF80B300), Color(0xFF809900),
  Color(0xFFE6B3B3), Color(0xFF6680B3), Color(0xFF66991A),
  Color(0xFFFF99E6), Color(0xFFCCFF1A), Color(0xFFFF1A66),
  Color(0xFFE6331A), Color(0xFF33FFCC), Color(0xFF66994D),
  Color(0xFFB366CC), Color(0xFF4D8000), Color(0xFFB33300),];
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius;
    
    Rect myRect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius - 14);

    var fillBrush = Paint()..color = Color(0xFFFFFFFF);
    var backgroudBrush = Paint()..color = Color(0xFF77DDFF);
    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);

    var secHandBrush = Paint()
      ..color = Colors.blue[300]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    var startAngle = -30 * pi / 180;
    var sweepAngle = pi / 180.0 * (360.0 / 12.0);
    canvas.drawCircle(center, radius - 10, backgroudBrush);
    for (double i = 0; i < 12; i += 1) {
      var paintcolor = Paint()
        ..color = categoryColors[i.toInt()]
        ..strokeWidth = 4
        ..style = PaintingStyle.fill
        ..strokeCap = StrokeCap.round;
      
      startAngle += sweepAngle;
      canvas.drawArc(myRect, startAngle, sweepAngle, true, paintcolor);
    }
    canvas.drawCircle(center, radius - 50, fillBrush);
    var hourHandX = centerX + 80 +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180) * 0;
    var hourHandY = centerX + 80 +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180) * 0;
    canvas.drawLine(Offset(hourHandX, hourHandY), Offset(hourHandX + 20, hourHandY + 20), secHandBrush);
    canvas.drawCircle(Offset(hourHandX + 20, hourHandY + 20), 12, backgroudBrush);

    var minHandX = centerX - 80 +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180) * 0;
    var minHandY = centerX - 80 +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180) * 0;
    canvas.drawLine(Offset(minHandX, minHandY), Offset(minHandX - 20, minHandY - 20), secHandBrush);
    canvas.drawCircle(Offset(minHandX - 20, minHandY - 20), 12, backgroudBrush);

    var secHandX = centerX - 80 +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180) * 0;
    var secHandY = centerX + 80 +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180) * 0;
    canvas.drawLine(Offset(secHandX, secHandY), Offset(secHandX - 20, secHandY + 20), secHandBrush);
    canvas.drawCircle(Offset(secHandX - 20, secHandY + 20), 12, backgroudBrush);


    //canvas.drawCircle(center, 16, centerFillBrush);

    
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'Expense',
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center
    );
    textPainter.layout();
    // Draw the text centered around the point (50, 100) for instance
    final offset = Offset(centerX - 25, centerY - 30);
    textPainter.paint(canvas, offset);
    final textPainterbalance = TextPainter(
      text: TextSpan(
        text: '100.000\$',
        style: TextStyle(
          color: Colors.black,
          fontSize: 23,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center
    );
    textPainterbalance.layout();
    // Draw the text centered around the point (50, 100) for instance
    textPainterbalance.paint(canvas, Offset(centerX - 50, centerY - 12));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
/*
class SchedulePainter extends CustomPainter {
  var dateTime = DateTime.now();
  var schedule = ScheduleData();
  //60 sec - 360, 1 sec - 6degree
  //12 hours  - 360, 1 hour - 30degrees, 1 min - 0.5degrees

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius;
    
    Rect myRect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius - 14);

    var fillBrush = Paint()..color = Color(0xFF444974);

    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);

    var secHandBrush = Paint()
      ..color = Colors.orange[300]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    var startAngle = -30 * pi / 180;
    var sweepAngle = pi / 180.0 * (360.0 / 12.0);

    for (double i = 0; i < 12; i += 1) {
      var paintcolor = Paint()
        ..color = schedule.taskColor[i.toInt()]
        ..strokeWidth = 4
        ..style = PaintingStyle.fill
        ..strokeCap = StrokeCap.round;
      
      startAngle += sweepAngle;
      canvas.drawArc(myRect, startAngle, sweepAngle, true, paintcolor);
    }
    canvas.drawCircle(center, radius - 40, fillBrush);
    //canvas.drawCircle(center, radius - 40, outlineBrush);

    var hourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);

    for (double i = 0; i < 12; i += 1) {
      var x1 = centerX + (innerCircleRadius - 55)* cos(i * 30 * pi / 180);
      var y1 = centerX + (innerCircleRadius - 55) * sin(i * 30 * pi / 180);

      var x2 = centerX + (innerCircleRadius - 45) * cos(i * 30 * pi / 180);
      var y2 = centerX + (innerCircleRadius - 45) * sin(i * 30 * pi / 180);
      startAngle += sweepAngle;
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
*/