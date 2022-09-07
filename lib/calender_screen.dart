import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter += 2;
    });
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
