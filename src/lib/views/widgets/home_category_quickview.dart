import 'package:dugbet/consts/color/colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_history_page.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_list/transaction_list.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_list/transaction_item.dart';

import 'package:dugbet/views/pages/transaction_history/transaction_list/transaction_item_list.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_list/transaction_item_summary.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fl_chart/fl_chart.dart';

class PieQuickView extends StatefulWidget {
  const PieQuickView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PieQuickViewState createState() => _PieQuickViewState();
}

class _PieQuickViewState extends State<PieQuickView> {
  @override
  void initState() {
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
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
  List<Color> categoryColors = [
    ColorPalette.primaryColor,
    ColorPalette.secondaryColor,
    ColorPalette.defaultText
  ];
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius;

    Rect myRect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius - 14);

    var fillBrush = Paint()..color = const Color(0xFFFFFFFF);
    var backgroudBrush = Paint()..color = const Color(0xFF77DDFF);
    var outlineBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var centerFillBrush = Paint()..color = const Color(0xFFEAECFF);

    var secHandBrush = Paint()
      ..color = Colors.blue[300]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    var minHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var hourHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    var dashBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    var startAngle = -30 * pi / 180;
    var sweepAngle = pi / 180.0 * (360.0 / 12.0);
    canvas.drawCircle(center, radius - 10, backgroudBrush);
    for (double i = 0; i < 12; i += 1) {
      var paintcolor = Paint()
        ..color = categoryColors[((i / 4).toInt())]
        ..strokeWidth = 4
        ..style = PaintingStyle.fill
        ..strokeCap = StrokeCap.round;

      startAngle += sweepAngle;
      canvas.drawArc(myRect, startAngle, sweepAngle, true, paintcolor);
    }
    canvas.drawCircle(center, radius - 50, fillBrush);
    var hourHandX = centerX +
        80 +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180) * 0;
    var hourHandY = centerX +
        80 +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180) * 0;
    canvas.drawLine(Offset(hourHandX, hourHandY),
        Offset(hourHandX + 20, hourHandY + 20), secHandBrush);
    canvas.drawCircle(
        Offset(hourHandX + 20, hourHandY + 20), 12, backgroudBrush);

    var minHandX = centerX -
        80 +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180) * 0;
    var minHandY = centerX -
        80 +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180) * 0;
    canvas.drawLine(Offset(minHandX, minHandY),
        Offset(minHandX - 20, minHandY - 20), secHandBrush);
    canvas.drawCircle(Offset(minHandX - 20, minHandY - 20), 12, backgroudBrush);

    var secHandX = centerX -
        80 +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180) * 0;
    var secHandY = centerX +
        80 +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180) * 0;
    canvas.drawLine(Offset(secHandX, secHandY),
        Offset(secHandX - 20, secHandY + 20), secHandBrush);
    canvas.drawCircle(Offset(secHandX - 20, secHandY + 20), 12, backgroudBrush);

    //canvas.drawCircle(center, 16, centerFillBrush);

    final textPainter = TextPainter(
        text: const TextSpan(
          text: 'Expense',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    textPainter.layout();
    // Draw the text centered around the point (50, 100) for instance
    final offset = Offset(centerX - 25, centerY - 30);
    textPainter.paint(canvas, offset);
    final textPainterbalance = TextPainter(
        text: const TextSpan(
          text: '100.000\$',
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    textPainterbalance.layout();
    // Draw the text centered around the point (50, 100) for instance
    textPainterbalance.paint(canvas, Offset(centerX - 50, centerY - 12));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TransactionQuickView extends StatefulWidget {
  const TransactionQuickView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TransactionQuickViewState createState() => _TransactionQuickViewState();
}

class _TransactionQuickViewState extends State<TransactionQuickView> {
  @override
  void initState() {
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<TransactionTemplate> transaction_list = groupTransactions()[0];
    // get top 3 transaction
    while (transaction_list.length > 3) {
      transaction_list.removeLast();
    }
    return Container(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 20.0, bottom: 0.0),
      decoration: BoxDecoration(
          color: ColorPalette.white.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          border: Border.all(color: ColorPalette.white, width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QVTransactionItemList(transaction_list: transaction_list),
          //const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  List<List<TransactionTemplate>> groupTransactions() {
    transaction_list.sort((a, b) => a.date.compareTo(b.date));
    List<List<TransactionTemplate>> groupedTransactions = [];
    List<TransactionTemplate> temp = [];
    int currentDay = transaction_list[0].date.day;

    for (var transaction in transaction_list) {
      if (transaction.date.day == currentDay) {
        temp.add(transaction);
      } else {
        groupedTransactions.add(temp);
        temp = [];
        temp.add(transaction);
        currentDay = transaction.date.day;
      }
    }
    if (temp.isNotEmpty) {
      groupedTransactions.add(temp);
    }
    return groupedTransactions;
  }
}

const maxDescription = 16;
const maxTitle = 14;

class QVTransactionItemList extends StatelessWidget {
  const QVTransactionItemList({super.key, required this.transaction_list});
  final List<TransactionTemplate> transaction_list;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var transaction in transaction_list) ...[
          InkWell(
            onTap: onTapTransaction,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: ColorPalette.white,
                          borderRadius: BorderRadius.circular(18.v),
                          border: Border.all(
                              color: ColorPalette.black, width: 1.0.v),
                        ),
                        height: 36.v,
                        width: 36.v,
                        child: Icon(transaction.icon)),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            transaction.title.length > maxTitle
                                ? '${transaction.title.substring(0, maxTitle)}...'
                                : transaction.title,
                            style: theme.textTheme.bodyMedium),
                        Text(
                            transaction.description.length > maxDescription
                                ? '${transaction.description.substring(0, maxDescription)}...'
                                : transaction.description,
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: ColorPalette.grey)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      transaction.amount.toString(),
                      style: theme.textTheme.headlineLarge?.copyWith(
                          color: transaction.type == 1
                              ? ColorPalette.incomeText
                              : ColorPalette.expenseText),
                    ),
                    SizedBox(width: 2.0.v),
                    SvgPicture.asset(
                      "assets/images/dIcon.svg",
                      colorFilter: ColorFilter.mode(
                          transaction.type == 1
                              ? ColorPalette.incomeText
                              : ColorPalette.expenseText,
                          BlendMode.srcIn),
                    )
                  ],
                ),
              ],
            ),
          )
        ]
      ],
    );
  }

  onTapTransaction() => Get.toNamed(AppPage.transactionPage);
}

class StatQuickView extends StatefulWidget {
  const StatQuickView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StatQuickViewState createState() => _StatQuickViewState();
}

class _StatQuickViewState extends State<StatQuickView> {
  @override
  void initState() {
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 20.0, bottom: 0.0),
      decoration: BoxDecoration(
          color: ColorPalette.white.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          border: Border.all(color: ColorPalette.white, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                "Income",
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: ColorPalette.incomeText),
              ),
              Text(
                "100.000\$",
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: ColorPalette.incomeText),
              ),
              Text(
                "Expense",
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: ColorPalette.expenseText),
              ),
              Text(
                "200.000\$",
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: ColorPalette.expenseText),
              ),
            ],
          ),
          Container(
            width: 100,
            height: 200,
            child: BarChartSample5(),
          ),
        ],
      ),
    );
  }
}

class BarChartSample5 extends StatefulWidget {
  const BarChartSample5({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample5State();
}
class BarChartSample5State extends State<BarChartSample5> {
  static const double barWidth = 22;
  static const shadowOpacity = 0.2;
  static const mainItems = <int, List<double>>{
    0: [10, 0],
    1: [0, 15],
  };
  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.white, fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Expense';
        break;
      default:
        return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget topTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.white, fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '';
        break;
      default:
        return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.white, fontSize: 10);
    String text;
    if (value == 0) {
      text = '0';
    } else {
      text = '${value.toInt()}0k';
    }
    return SideTitleWidget(
      angle: AppUtils().degreeToRadian(value < 0 ? -45 : 45),
      axisSide: meta.axisSide,
      space: 1,
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }



  BarChartGroupData generateGroup(
    int x,
    double value1,
    double value2
  ) {
    final isTop = value1 >= 0;
    final sum = value1 + value2;
    final isTouched = touchedIndex == x;
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      showingTooltipIndicators: isTouched ? [0] : [],
      barRods: [
        BarChartRodData(
          toY: sum,
          width: barWidth,
          borderRadius: isTop
              ? const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                )
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
          rodStackItems: [
            BarChartRodStackItem(
              0,
              value1,
              ColorPalette.incomeText
                  ,
              const BorderSide(color: Colors.transparent),
            ),
            BarChartRodStackItem(
              value1,
              (value1 + value2),
              ColorPalette.expenseText
                  ,
              const BorderSide(color: Colors.transparent),
            ),
          ],
        ),
      ],
    );
  }

  bool isShadowBar(int rodIndex) => rodIndex == 1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: BarChart(
          BarChartData(
            // backgroundColor: ColorPalette.tearButton,
            alignment: BarChartAlignment.start,
            maxY: 20,
            minY: 0,
            groupsSpace: 12,
            // backgroundColor: ColorP,
           
            // do not show tilesdata
            
            titlesData: FlTitlesData(
              show: false,
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 32,
                  getTitlesWidget: topTitles,
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 32,
                  getTitlesWidget: bottomTitles,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  //getTitlesWidget: leftTitles,
                  interval: 2,
                  reservedSize: 1,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  //getTitlesWidget: rightTitles,
                  interval: 2,
                  reservedSize: 1,
                ),
                drawBehindEverything: true
              ),
            ),
            gridData: FlGridData(
              show: false,
              checkToShowHorizontalLine: (value) => value % 5 == 0,
             
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: mainItems.entries
                .map(
                  (e) => generateGroup(
                    e.key,
                    e.value[0],
                    e.value[1]
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}


class AppUtils {
  factory AppUtils() {
    return _singleton;
  }

  AppUtils._internal();
  static final AppUtils _singleton = AppUtils._internal();

  double degreeToRadian(double degree) {
    return degree * pi / 180;
  }

  double radianToDegree(double radian) {
    return radian * 180 / pi;
  }
}
