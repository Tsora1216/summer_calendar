import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class EventData {
  DateTime date;
  List<String> events;

  EventData(this.date, this.events);
}

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderScreen> {
  List<EventData> eventList = [];
  List<String> selectEvent = [];

  @override
  void initState() {
    super.initState();
    eventList = [
      EventData(DateTime.now().add(Duration(days: 2)), ["event", "event1"]),
      EventData(DateTime.now().add(Duration(days: 3)),
          ["event1", "event1", "event1", "event1"]),
      EventData(DateTime.now().add(Duration(days: 4)), ["event2", "event1"]),
      EventData(DateTime.now().add(Duration(days: 5)), ["event3", "event1"]),
      EventData(DateTime.now().add(Duration(days: 6)), ["event4", "event1"]),
      EventData(DateTime.now().add(Duration(days: 7)), ["event45", "event1"]),
      EventData(DateTime.now().add(Duration(days: 8)), ["event456", "event1"]),
      EventData(DateTime.now().add(Duration(days: 9)), ["event456", "event1"]),
    ];
  }

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("カレンダー"),
      ),
      body: Stack(
        children: [
          Center(
            child: TableCalendar(
              selectedDayPredicate: (day){
                return isSameDay(_selectedDay,day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                print(isSameDay(selectedDay,_selectedDay));
                if (!isSameDay(selectedDay,_selectedDay))
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },
              firstDay: DateTime.utc(2022, 4, 1),
              lastDay: DateTime.utc(2025, 12, 31),
              focusedDay: _focusedDay,
              locale: 'ja_JP',
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Container(
              height: 50,
              color: Colors.red,
              width: 50,
              child: GestureDetector(
                onTap: () => null,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  void _selectRightButton(){
  }
}
