// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class calendarpage extends StatefulWidget {
  const calendarpage({Key? key}) : super(key: key);

  @override
  State<calendarpage> createState() => _State();
}

class _State extends State<calendarpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
            child: SfCalendar(
              view: CalendarView.month,
              firstDayOfWeek: 1,
              initialDisplayDate: DateTime(2022, 04, 23, 10, 46),
              initialSelectedDate: DateTime(2022, 04, 23, 10, 46),
              allowViewNavigation: true,
              viewNavigationMode: ViewNavigationMode.snap,
            ),
          ),
        ],
      ),
    );
  }
}
