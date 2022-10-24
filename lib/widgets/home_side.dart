import 'package:flutter/material.dart';

class HomeSide extends StatefulWidget {
  const HomeSide({Key? key}) : super(key: key);

  @override
  State<HomeSide> createState() => _HomeSideState();
}

class _HomeSideState extends State<HomeSide> {
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(2001),
            lastDate: DateTime(DateTime.now().year + 1),
            currentDate: dateTime,
            
            onDateChanged: (value) {
              setState(() {
                dateTime = value;
              });
            })
      ],)
    ;
  }
}
