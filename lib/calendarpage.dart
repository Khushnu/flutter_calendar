import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  var initialDat = DateTime.now();
  var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if(month==1){
                              month=12;
                              year--;
                            }else{
       month--;
                            }
                           
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_left_outlined)),
                    Text(DateFormat('MMMM').format(DateTime(year, month))),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if(month==12){
                              month=1;
                            year++;
                            }else{
      month++;
                            }
                            
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_right_outlined)),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            year--;
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_left_outlined)),
                    Text(DateFormat('yyyy').format(DateTime(year, month))),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            year++;
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_right_outlined)),
                  ],
                ),
              ],
            ),
            Table(
              border: TableBorder.all(color: Colors.black),
              children: [
                TableRow(
                    children: days.map((e) => Center(child: Text(e))).toList()),
                ...List.generate(5, (mainIndex) {
                  // final weekDay  = dateTime.weekday;
                  return TableRow(
                      children: List.generate(7, (index) {
                    String da =
                        DateFormat('EEE').format(DateTime(year, month, 1));
                    Color tc = Colors.grey;
      
      
                  
                  //DateTime lastDayofmonth = DateTime(year, month + 1 , 0);
                   
                    
      
                    int minusIndex = days.indexOf(da);
                    DateTime day = DateTime(year, month, (7 * mainIndex) + (index + 1) - minusIndex);
                    String dy = DateFormat('EEE').format(day); 
                    
                    if(month==day.month&&year==day.year){
                      tc=Colors.black;
                    }
      
                    if (day.month == initialDat.month&&day.year==initialDat.year) {
                      tc = Colors.black;
                      if (dy == 'Sun' || dy == 'Sat') {
                      tc = Colors.red.shade500;
                    }
                     if (day.year == initialDat.year &&
                        day.month == initialDat.month &&
                        day.day == initialDat.day) {
                      tc = Colors.blue;
                    }
                    }
                    if (kDebugMode) {
                      print(da);
                    }
                 
      
                    
                  
      
                    // ignore: unrelated_type_equality_checks
                    return Center(
                        child: Text(
                      day.day.toString(),
                      style: TextStyle(color: tc),
                    ));
                  }));
                })
              ],
            ),
          ],
        ),
      ),
    ));
  }
}