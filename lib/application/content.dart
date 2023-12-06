import 'package:flutter/material.dart';
import 'package:sample_calendar/logic/calendar_logic.dart';

class CalendarContent extends StatelessWidget {
  const CalendarContent({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: THIS IS A STATE THAT NEED TO BE MANAGED USING RIVERPOD
    var date = DateTime.now();

    int month = date.month;
    int year = date.year;

    return Expanded(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints1) {
      return Column(
        children: [
          WeekHeader(
            height: constraints1.maxHeight * 0.05,
            width: constraints1.maxWidth,
          ),
          WeekArr(
              arr: return_2D_list(return_no_of_days(month, year), DateTime.utc(year, month, 1))),
        ],
      );
    }));
  }
}

class WeekHeader extends StatelessWidget {
  final double width;
  final double height;

  const WeekHeader({super.key, required this.height, required this.width});

  static const norm_list = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  static const not_norm_list = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];
  static bool is_norm = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        color: Colors.orangeAccent,
        child: Row(
          children: [
            for (int i = 0; i < 7; ++i)
              Container(
                  width: width / 7.0,
                  height: height,
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                  child: Center(
                      child: Text(is_norm ? norm_list[i] : not_norm_list[i])))
          ],
        ));
  }
}

class WeekArr extends StatelessWidget {
  final List<List<int>> arr;

  const WeekArr({super.key, required this.arr});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints1) {
        return Column(
          children: [
            for (int i = 0; i < 6; ++i)
              if (i % 2 == 0)
                Week(
                  wkHeight: constraints1.maxHeight / 6.0,
                  wkColor: Colors.yellowAccent,
                  wkArr: arr[i],
                )
              else
                Week(
                    wkArr: arr[i],
                    wkHeight: constraints1.maxHeight / 6.0,
                    wkColor: Colors.greenAccent)
          ],
        );
      },
    ));
  }
}

class Week extends StatelessWidget {
  final double wkHeight;
  final Color wkColor;
  final List<int> wkArr;

  const Week(
      {super.key,
      required this.wkHeight,
      required this.wkColor,
      required this.wkArr});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: wkHeight,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints1) {
        return Row(
          children: [
            for (int i = 0; i < 7; ++i)
              Day(
                dayWidth: constraints1.maxWidth / 7.0,
                dayColor: wkColor,
                dayNum: wkArr[i],
                dayHeight: constraints1.maxHeight,
              )
          ],
        );
      }),
    );
  }
}

class Day extends StatelessWidget {
  final double dayWidth;
  final Color dayColor;
  final int dayNum;
  final double dayHeight;

  const Day(
      {super.key,
      required this.dayWidth,
      required this.dayColor,
      required this.dayNum,
      required this.dayHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dayWidth,
      height: dayHeight,
      decoration: BoxDecoration(
        color: dayColor,
        border: Border.all(
          width: 0.5,
        ),
      ),
      child: Center(child: Text(dayNum.toString())),
    );
  }
}
