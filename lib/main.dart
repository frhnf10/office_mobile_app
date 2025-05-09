import 'package:flutter/material.dart';
// import 'package:office_mobile_app/landing_page.dart';
import 'package:office_mobile_app/holidaymanagement.dart';
// import 'package:office_mobile_app/dashboard.dart';
// import 'package:office_mobile_app/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Office Management App', home: HolidayHRD());
    // return MaterialApp(title: 'Tester', home: widgettest());
  }
}
