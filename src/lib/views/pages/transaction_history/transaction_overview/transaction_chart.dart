import 'dart:math';

import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/fonts/text_theme_builder.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_history_controller.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dugbet/consts/color/colors.dart';

class TransactionChart extends GetView<TransactionHistoryController> {
  const TransactionChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, int> timeMap = {"week": 0, "month": 1, "quarter": 2, "year": 3};
    return Container(
      //margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: ColorPalette.black, width: 1)
      ),
      width: double.infinity,
      height: 370.0,
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 20.0, bottom: 34.0),
      child: Obx(
        () {
          return  Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Statistics',
                    style: TextThemeBuilder.robotoTextTheme.titleLarge
                  ),
                  DropdownButton<String>(
                      value: controller.selectMode.value,
                      underline: Container(
                        color: Colors.grey,
                        width: 1,
                      ),
                      dropdownColor: ColorPalette.white.withOpacity(0.9),
                      items: const [
                        // the chart cannot show transactions just for one day
                        // DropdownMenuItem(
                        //     value: "today", child: Text("Today")),
                        DropdownMenuItem(
                            value: "week", child: Text("This week")),
                        DropdownMenuItem(
                            value: "month", child: Text("This month")),
                        DropdownMenuItem(
                            value: "quarter", child: Text("This quarter")),
                        DropdownMenuItem(
                            value: "year", child: Text("This year"))
                      ],
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      onChanged: (String? value) =>
                          controller.onModeClick(value!),
                    )
                ],
              ),
              const SizedBox(height: 10.0),
              Flexible(
                child: LineChart(
                  sampleData[timeMap[controller.selectMode.value]!],
                  swapAnimationDuration: const Duration(milliseconds: 250),
                ),
              ),
            ],
          );
        }
      )
    );
  }

  double transformNumber(double number, double maxVal) {
    // number of categories along the axis is 5
    if (maxVal == 0)
      return number;
    double oneFifth = maxVal/5;
    if (number >= 4*oneFifth) {
      return 4.0 + (number - 4*oneFifth)/oneFifth;
    }
    else if (number >= 3*oneFifth) {
      return 3.0 + (number - 3*oneFifth)/oneFifth;
    }
    else if (number >= 2*oneFifth) {
      return 2.0 + (number - 2*oneFifth)/oneFifth;
    }
    else if (number >= oneFifth) {
      return 1.0 + (number - oneFifth)/oneFifth;
    }
    else {
      return number/oneFifth;
    }
  }

  String shortenFigure(String fig) {
    if (fig.length <= 3) {
      return fig;
    }
    else if (fig.length <= 6) {
      return fig.substring(0, fig.length - 3) + 'K';
    }
    else {
      return fig.substring(0, fig.length - 6) + 'M';
    }
  }

  List<LineChartData> get sampleData => [
      // week
      // X: days of week
      // 0, 1: Monday, 2: Tuesday, 3: Wednesday, 4: Thursday, 5: Friday, 6: Saturday, 7: Sunday, 8
      LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesDataWeek,
        borderData: borderData,
        lineBarsData: [lineChartBarDataWeek],
        minX: 0,
        maxX: 8,
        maxY: 5,
        minY: 0,
      ),
      // month
      // X: days of month
      // 0, 1: 1st, 2: 2nd, ..., 30: 30th, 31: 31st, 32
      LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesDataMonth,
        borderData: borderData,
        lineBarsData: [lineChartBarDataMonth],
        minX: 0,
        maxX: 32,
        maxY: 5,
        minY: 0,
      ),
      // quarter
      // X: months of the quarter
      // 0, 1: Jan, 2: Feb, 3: Mar, 4
      LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesDataQuarter,
        borderData: borderData,
        lineBarsData: [lineChartBarDataQuarter],
        minX: 0,
        maxX: 4,
        maxY: 5,
        minY: 0,
      ),
      // year
      // X: months of the year
      // 0, 1: Jan, 2: Feb, 3: Mar, 4: Apr, 5: May, 6: Jun, 7: Jul, 8: Aug, 9: Sep, 10: Oct, 11: Nov, 12: Dec, 13
      LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesDataYear,
        borderData: borderData,
        lineBarsData: [lineChartBarDataYear],
        minX: 0,
        maxX: 13,
        maxY: 5,
        minY: 0,
      )
    ];

  FlTitlesData get titlesDataWeek => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitlesWeek,
        ),
        rightTitles:  AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles:  AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitlesWeek(),
        ),
      );

  SideTitles leftTitlesWeek() => SideTitles(
        getTitlesWidget: leftTitleWidgetsWeek,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );
  Widget leftTitleWidgetsWeek(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    int oneFifth = getVerticalMaxWeek()~/5;
    switch (value.toInt()) {
      case 1:
        text = shortenFigure(oneFifth.toString());
        break;
      case 2:
        text = shortenFigure((2*oneFifth).toString());
        break;
      case 3:
        text = shortenFigure((3*oneFifth).toString());
        break;
      case 4:
        text = shortenFigure((4*oneFifth).toString());
        break;
      default:
        text = '';
        break;
    }
    return Text(text, style: style, textAlign: TextAlign.center);
  }
  Widget bottomTitleWidgetsWeek(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Mon', style: style);
        break;
      case 3:
        text = const Text('Wed', style: style);
        break;
      case 5:
        text = const Text('Fri', style: style);
        break;
      case 7:
        text = const Text('Sun', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitlesWeek => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgetsWeek,
      );

  List<FlSpot> getTransactionsWeekData() {
    List<FlSpot> spots = [];
    List<TransactionTemplate> transactions = controller.filterTransactionsByCurrentWeek();
    for (int wday = 1; wday <= 7; wday++) {
      double sum = 0;
      for (var transaction in transactions) {
        if (transaction.date.weekday == wday && transaction.type == 0) {
          sum += transaction.amount;
        }
      }
      spots.add(FlSpot(wday.toDouble(), transformNumber(sum, getVerticalMaxWeek())));
    }
    return spots;
  }

  double getVerticalMaxWeek() {
    List<TransactionTemplate> transactions = controller.filterTransactionsByCurrentWeek();
    double maxSum = 0;
    for (int wday = 1; wday <= 7; wday++) {
      double sum = 0;
      for (var transaction in transactions) {
        if (transaction.date.weekday == wday && transaction.type == 0) {
          sum += transaction.amount;
        }
      }
      maxSum = max(maxSum, sum);
    }
    //print("maxSum is $maxSum");
    return maxSum;
  }
  
  LineChartBarData get lineChartBarDataWeek => LineChartBarData(
        isCurved: true,
        color: ColorPalette.incomeText,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData:  FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: getTransactionsWeekData(),
      );


  FlTitlesData get titlesDataMonth => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitlesMonth,
        ),
        rightTitles:  AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles:  AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitlesMonth(),
        ),
      );

  SideTitles leftTitlesMonth() => SideTitles(
        getTitlesWidget: leftTitleWidgetsMonth,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );
  Widget leftTitleWidgetsMonth(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    int oneFifth = (getVerticalMaxMonth()/5).toInt();
    switch (value.toInt()) {
      case 1:
        text = shortenFigure((oneFifth).toString()) + 'd';
        break;
      case 2:
        text = shortenFigure((2*oneFifth).toString()) + 'd';
        break;
      case 3:
        text = shortenFigure((3*oneFifth).toString()) + 'd';
        break;
      case 4:
        text = shortenFigure((4*oneFifth).toString()) + 'd';
        break;
      default:
        text = '';
        break;
    }
    return Text(text, style: style, textAlign: TextAlign.center);
  }
  Widget bottomTitleWidgetsMonth(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 6:
        text = const Text('6th', style: style);
        break;
      case 12:
        text = const Text('12th', style: style);
        break;
      case 18:
        text = const Text('18th', style: style);
        break;
      case 24:
        text = const Text('24th', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitlesMonth => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgetsMonth,
      );

  List<FlSpot> getTransactionsMonthData() {
    List<FlSpot> spots = [];
    List<TransactionTemplate> transactions = controller.filterTransactionsByCurrentMonth();
    for (int mday = 1; mday <= 31; mday++) {
      double sum = 0;
      for (var transaction in transactions) {
        if (transaction.date.day == mday && transaction.type == 0) {
          sum += transaction.amount;
        }
      }
      spots.add(FlSpot(mday.toDouble(), transformNumber(sum, getVerticalMaxMonth())));
    }
    return spots;
  }

  double getVerticalMaxMonth() {
    List<TransactionTemplate> transactions = controller.filterTransactionsByCurrentMonth();
    double maxSum = 0;
    for (int mday = 1; mday <= 31; mday++) {
      double sum = 0;
      for (var transaction in transactions) {
        if (transaction.date.day == mday && transaction.type == 0) {
          sum += transaction.amount;
        }
      }
      maxSum = max(maxSum, sum);
    }
    //print("maxSum is $maxSum");
    return maxSum;
  }
  
  LineChartBarData get lineChartBarDataMonth => LineChartBarData(
        isCurved: true,
        color: ColorPalette.incomeText,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData:  FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: getTransactionsMonthData(),
      );

  FlTitlesData get titlesDataQuarter => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitlesQuarter,
        ),
        rightTitles:  AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles:  AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitlesQuarter(),
        ),
      );

  SideTitles leftTitlesQuarter() => SideTitles(
        getTitlesWidget: leftTitleWidgetsQuarter,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );
  Widget leftTitleWidgetsQuarter(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    int oneFifth = (getVerticalMaxQuarter()/5).toInt();
    switch (value.toInt()) {
      case 1:
        text = shortenFigure(oneFifth.toString()) + 'd';
        break;
      case 2:
        text = shortenFigure((2*oneFifth).toString()) + 'd';
        break;
      case 3:
        text = shortenFigure((3*oneFifth).toString()) + 'd';
        break;
      case 4:
        text = shortenFigure((4*oneFifth).toString()) + 'd';
        break;
      default:
        text = '';
        break;
    }
    return Text(text, style: style, textAlign: TextAlign.center);
  }
  Widget bottomTitleWidgetsQuarter(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Jan', style: style);
        break;
      case 2:
        text = const Text('Feb', style: style);
        break;
      case 3:
        text = const Text('Mar', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitlesQuarter => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgetsQuarter,
      );

  List<FlSpot> getTransactionsQuarterData() {
    List<FlSpot> spots = [];
    List<TransactionTemplate> transactions = controller.filterTransactionsByCurrentQuarter();
    for (int m = 1; m <= 3; m++) {
      double sum = 0;
      for (var transaction in transactions) {
        if (transaction.date.month == m && transaction.type == 0) {
          sum += transaction.amount;
        }
      }
      spots.add(FlSpot(m.toDouble(), transformNumber(sum, getVerticalMaxQuarter())));
    }
    return spots;
  }

  double getVerticalMaxQuarter() {
    List<TransactionTemplate> transactions = controller.filterTransactionsByCurrentQuarter();
    double maxSum = 0;
    for (int m = 1; m <= 3; m++) {
      double sum = 0;
      for (var transaction in transactions) {
        if (transaction.date.month == m && transaction.type == 0) {
          sum += transaction.amount;
        }
      }
      maxSum = max(maxSum, sum);
    }
    //print("maxSum is $maxSum");
    return maxSum;
  }
  
  LineChartBarData get lineChartBarDataQuarter => LineChartBarData(
        isCurved: true,
        color: ColorPalette.incomeText,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData:  FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: getTransactionsQuarterData(),
      );

  FlTitlesData get titlesDataYear => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitlesYear,
        ),
        rightTitles:  AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles:  AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitlesYear(),
        ),
      );

  SideTitles leftTitlesYear() => SideTitles(
        getTitlesWidget: leftTitleWidgetsYear,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );
  Widget leftTitleWidgetsYear(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    int oneFifth = (getVerticalMaxYear()/5).toInt();
    switch (value.toInt()) {
      case 1:
        text = shortenFigure(oneFifth.toString()) + 'd';
        break;
      case 2:
        text = shortenFigure((2*oneFifth).toString()) + 'd';
        break;
      case 3:
        text = shortenFigure((3*oneFifth).toString()) + 'd';
        break;
      case 4:
        text = shortenFigure((4*oneFifth).toString()) + 'd';
        break;
      default:
        text = '';
        break;
    }
    return Text(text, style: style, textAlign: TextAlign.center);
  }
  Widget bottomTitleWidgetsYear(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Jan', style: style);
        break;
      case 4:
        text = const Text('Apr', style: style);
        break;
      case 7:
        text = const Text('Jul', style: style);
        break;
      case 10:
        text = const Text('Oct', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitlesYear => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgetsYear,
      );

  List<FlSpot> getTransactionsYearData() {
    List<FlSpot> spots = [];
    List<TransactionTemplate> transactions = controller.filterTransactionsByCurrentYear();
    for (int m = 1; m <= 12; m++) {
      double sum = 0;
      for (var transaction in transactions) {
        if (transaction.date.month == m && transaction.type == 0) {
          sum += transaction.amount;
        }
      }
      spots.add(FlSpot(m.toDouble(), transformNumber(sum, getVerticalMaxYear())));
    }
    return spots;
  }

  double getVerticalMaxYear() {
    List<TransactionTemplate> transactions = controller.filterTransactionsByCurrentYear();
    double maxSum = 0;
    for (int m = 1; m <= 12; m++) {
      double sum = 0;
      for (var transaction in transactions) {
        if (transaction.date.month == m && transaction.type == 0) {
          sum += transaction.amount;
        }
      }
      maxSum = max(maxSum, sum);
    }
    //print("maxSum is $maxSum");
    return maxSum;
  }
  
  LineChartBarData get lineChartBarDataYear => LineChartBarData(
        isCurved: true,
        color: ColorPalette.incomeText,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData:  FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: getTransactionsYearData(),
      );


  LineTouchData get lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );
  
  FlGridData get gridData =>  FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom:
              BorderSide(color: ColorPalette.primaryColor.withOpacity(0.2), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );
}
