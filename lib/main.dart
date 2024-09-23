import 'package:flutter/material.dart';
import 'screens/member_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Tracking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MemberListScreen(),  // First screen of the app
    );
  }
}
