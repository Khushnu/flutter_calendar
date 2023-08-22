import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final keyy = GlobalKey<ScaffoldState>();

  DateTime initialDate = DateTime.now();
  DateTime curentdate = DateTime.now();
  int endingyear=5;
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  

  // List<DateTime> getDates(DateTime startDate, DateTime endDate ){
  //   List<DateTime> days = [];

  //   for(int i =0; i<= endDate.difference(startDate).inDays; i++){
  //     days.add(startDate.add(Duration(days: i)));
  //   }
  //   return days;
  // }

  getDate(DateTime date) {
    return curentdate = date;
  }

  @override
  Widget build(BuildContext context) {
    // JunkCalendarController calendarController = JunkCalendarController(initialDate: initialDate);
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    var listOfYears = List.generate(endingyear, (index) => year+index);

    // var dateformat = DateFormat('MMMM').format(initialDate);

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {});
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setStateModal) {
                        return Container(
                          height: screenHeight * 0.8,
                          width: screenWidth,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19)),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        border: Border.all(
                                            width: 1, color: Colors.grey)),
                                    child: const Icon(Icons.close),
                                  ),
                                  const SizedBox(
                                    width: 110,
                                  ),
                                  const Text(
                                    'Pick Up On',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                              // Text(isSelected ? curentdate.toString() : initialDate.toString()),
                              
                                  //  Container(
                                  //   height: screenHeight * 0.1,
                                  //   width: screenWidth * 0.9 + 16,
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.grey,
                                  //     borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
                                  //   ),
                                  //   child: Text('Mon, fri, 2023'),
                                  //  ),
                                  InkWell( 
                                    onTap: () async{ 
                                     var dialog = await showDialog(context: context, builder: (context){
                                        return AlertDialog.adaptive(
                                          title: Text('Select Year'),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          content: SizedBox(
                                            height: 100, 
                                            width: 50,                     
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [     
                                               Expanded(
                                                 child: ListView.builder(
                                                  itemCount:  listOfYears.length,
                                                  itemBuilder: (_,index){
                                                    var years = listOfYears[index];
                                                    // var selectedYear = year == years; 
                                                    bool iscurrentYear = year == years;
    
                                                  return Material(
                                                    color: Colors.transparent, 
                                                    child: Center(
                                                     
                                                        child: InkWell(
                                                           
                                                          onTap:(){
                                                            Navigator.of(context).pop(years);
                                                          //  setStateModal((){
                                                          //   year  = years;
                                                          //  });
                                                          } ,
                                                          child: Text(years.toString(), style: TextStyle(
                                                            color: iscurrentYear ? Colors.indigo.shade700 : Colors.black, fontSize: 19,), 
                                                            ),
                                                        ),
                                                      
                                                    ),
                                                  );
                                                 }),
                                               )
                                              ],
                                            ),
                                          )
                                        );
                                      });
                                      if(dialog !=null){
                                          setStateModal((){
                                                            year  = dialog;
                                                            curentdate =DateTime(year,curentdate.month,curentdate.day);
                                                           });
                                      }
                                    },
                                    child: Text(DateFormat('yyyy').format(DateTime(year)), style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),)),
                                    Text(DateFormat('EE-dd-MM').format(curentdate), style: TextStyle(fontSize: 18, ),),
                                   Container(
                                        height: screenHeight * 0.5 + 20,
                                        width: screenWidth * 0.9 + 16,
                                        padding: const EdgeInsets.all(6),
                                        decoration: const BoxDecoration(
                                            // color: Colors.grey,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(25),
                                                bottomRight:
                                                    Radius.circular(25))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      setStateModal(() {
                                                        if (month == 1 ) {
                                                          month == 12;
                                                          
                                                           year--;
                                                        } 
                                                        else {
                                                          month--;
                                                        }
                                                        // curentdate =DateTime(curentdate.year,month,curentdate.day);
                                                      });
                                                    },
                                                    icon: const Icon(Icons
                                                        .keyboard_arrow_left_outlined)),
                                                Text(DateFormat('MMMM').format(
                                                    DateTime(year, month)), style: TextStyle(fontSize: 18),),
                                                IconButton(
                                                    onPressed: () {
                                                      setStateModal(() {
                                                        if (month == 12) {
                                                          month == 1;
                                                          year++;
                                                          //  month++;
                                                        } else {
                                                          month++;
                                                        }
                                                        // curentdate =DateTime(curentdate.year,month,curentdate.day);
                                                      });
                                                    },
                                                    icon: const Icon(Icons
                                                        .keyboard_arrow_right_outlined))
                                              ],
                                            ),
                                            Table(
                                              children: [
                                                TableRow(
                                                  children: days
                                                      .map((e) => SizedBox(
                                                          height: 30,
                                                          width: 70,
                                                          child: Center(
                                                            child: Text(
                                                              e,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 19),
                                                            ),
                                                          )))
                                                      .toList(),
                                                ),
                                                ...List.generate(5,
                                                    (parentIndex) {
                                                 
                                                  return TableRow(
                                                      children: List.generate(7,
                                                          (index) {
                                                    String da =
                                                        DateFormat('EEE')
                                                            .format(DateTime(
                                                                year,
                                                                month,
                                                                1));
                                                    Color color = Colors.grey;
                                                    int minusIndex =
                                                        days.indexOf(da);
                                                    DateTime day = DateTime(
                                                        year,
                                                        month,
                                                        (7 * parentIndex) +
                                                            (index + 1) -
                                                            minusIndex);
                                                    // var formartDay = DateFormat('EEE').format(day);
                                                     bool isSelected = 
                                                      (day.year ==
                                                            initialDate.year &&
                                                        day.month ==
                                                            initialDate.month &&
                                                        day.day ==
                                                            initialDate.day); 

                                                      bool isCurrentDate = (curentdate.year == day.year &&
                                                       curentdate.month == day.month && curentdate.day == day.day);

                                                    

                                                    if (month == day.month &&
                                                        year == day.year) {
                                                      color = Colors.black;
                                                    }
                                                    if (day.month ==
                                                            initialDate.month &&
                                                        day.year ==
                                                            initialDate.year) {
                                                      color = Colors.black;
                                                    }

                                                    if (day.year ==
                                                            initialDate.year &&
                                                        day.month ==
                                                            initialDate.month &&
                                                        day.day ==
                                                            initialDate.day) {
                                                      color =
                                                          Colors.white;
                                                    }
                                                    // print(isSelected);
                                                    return  InkWell(
                                                      onTap: () {
                                                        setStateModal(() {            
                                                            curentdate = DateTime(year, month, day.day);}); 
                                                      },
                                                      child: Center(
                                                        child: Container(
                                                            height: 50,
                                                            width: 60,                            
                                                           decoration: BoxDecoration(
                                                             color:  isCurrentDate?Colors.indigo.shade900: Colors.transparent,
                                                             border: isSelected ? Border.all(
                                                              color: Colors.indigo.shade900
                                                             ) : null,
                                                             borderRadius: BorderRadius.circular(37)
                                                           ),
                                                            child: Center(
                                                                child: Text(
                                                               day.day
                                                                  .toString(),
                                                              style: TextStyle(
                                                                   color: isSelected ? Colors.black : isCurrentDate ? Colors.white :  color,
                                                                  fontSize: 16),
                                                            ))),
                                                      ),
                                                    );
                                                  }));
                                                })
                                              ],
                                            )
                                          ],
                                        )),
                                  
                               
                              const SizedBox(
                                height: 6,
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        color: Colors.indigo.shade600),
                                    child: const Center(
                                        child: Text(
                                      'Okay',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  )
                                ],
                              )
                            ]
                          ) 
                        );
                      },
                    );
                  });
            },
            child: const Text('Show Date'),
          )
        ],
      ),
    ));
  }
}

/*
 JunkCalendar( 
                                    controller: calendarController,
                                    initialDate: initialDate,
                                    titleBarBuilder: (date) {
                                      date = initialDate;
                                      var formattt  = DateFormat('MMMM-yyyy').format(date);
                                      return Text(formattt);
                                    }, 
                                    headerCellBuilder:(day){ 
                                      return  Text(day);
                                    },
                                    border: TableBorder.all(color: Colors.transparent),
                                    cellBuilder: (date, isCurrentMonth) { 
                                     date = initialDate;
                                     DateTime endDate = DateTime(initialDate.year, initialDate.month + 1 , 0); 
                                     var dates; 

                                     var d =  getDates(date, endDate); 
                                     String da= DateFormat('EEE').format(d);
                                    isCurrentMonth == date.month; 
                                      return Text(d.toString(), style: TextStyle(color: isCurrentMonth ? Colors.black : Colors.white),);
                                    },
                                    
                                  ),
*/
