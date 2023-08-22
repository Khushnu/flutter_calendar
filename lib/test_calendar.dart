import 'package:flutter/material.dart';

class CalendarTable extends StatelessWidget {
  final DateTime now = DateTime.now();
  final List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  CalendarTable({super.key});

  List<DateTime> generateDates(int year, int month) {
    int daysInMonth = DateTime(year, month + 1, 0).day;
    return List.generate(daysInMonth, (day) => DateTime(year, month, day + 1));
  }

  @override
  Widget build(BuildContext context) {
    int year = now.year;
    int month = now.month;
    List<DateTime> dates = generateDates(year, month);

    List<TableRow> rows = [];
    List<Widget> cells = [];

    for (int i = 0; i < dates.length; i++) {
      DateTime date = dates[i];
      String dayOfWeek = daysOfWeek[date.weekday - 1];
      cells.add(TableCell(
        child: Column(
          children: [
            Text(dayOfWeek),
            Text(date.day.toString()),
          ],
        ),
      ));

      // if ((i + 1) % 7 == 0 || i == dates.length - 1) {
      //   rows.add(TableRow(children: List.from(cells)));
      //   cells.clear();
      // }
    }

    print(rows); 
    
    return Table(
      children: rows,
    );
  }
}