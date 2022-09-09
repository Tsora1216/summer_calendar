import 'package:flutter/material.dart';
import 'package:summer_calendar/router_manager.dart';
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
      ///テストデータ
      EventData(DateTime.now().add(const Duration(days: 2)), ["event", "event1"]),
      EventData(DateTime.now().add(const Duration(days: 3)),
          ["event1", "event1", "event1", "event1"]),
      EventData(DateTime.now().add(const Duration(days: 4)), ["event2", "event1"]),
      EventData(DateTime.now().add(const Duration(days: 5)), ["event3", "event1"]),
      EventData(DateTime.now().add(const Duration(days: 6)), ["event4", "event1"]),
      EventData(DateTime.now().add(const Duration(days: 7)), ["event45", "event1"]),
      EventData(DateTime.now().add(const Duration(days: 8)), ["event456", "event1"]),
      EventData(DateTime.now().add(const Duration(days: 9)), ["event456", "event1"]),
    ];
  }

  ///入力画面に遷移
  void _segueToTextInput(BuildContext context) {
    Navigator.of(context).pushNamed(Routers.textInput);
  }

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("カレンダー"),
      ),
      body: SizedBox(
        height: screenSize.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  TableCalendar(
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      final filterEvent = eventList
                          .where(
                              (element) => isSameDay(element.date, selectedDay))
                          .toList();
                      if (!isSameDay(selectedDay, _selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay =
                              focusedDay; // update `_focusedDay` here as well
                          if (filterEvent.isNotEmpty) {
                            selectEvent = filterEvent.first.events;
                          }
                        });
                      }
                    },
                    firstDay: DateTime.utc(2022, 4, 1),
                    lastDay: DateTime.utc(2025, 12, 31),
                    focusedDay: _focusedDay,
                    locale: 'ja_JP',
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      for (var event in selectEvent)
                        ListTile(
                          title: Text(event),
                        )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 24,
              right: 24,
              child: GestureDetector(
                onTap: () => _segueToTextInput(context),
                child: Container(
                  height: 50,
                  color: Colors.red,
                  width: 50,
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectRightButton() {}
}
