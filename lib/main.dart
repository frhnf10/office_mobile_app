import 'package:flutter/material.dart';
import 'package:office_mobile_app/dashboard.dart';
// import 'package:office_mobile_app/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Dashboard App', home: DashboardPage());
    // return MaterialApp(title: 'Tester', home: widgettest());
  }
}
