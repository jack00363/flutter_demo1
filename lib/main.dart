import 'package:flutter/material.dart';
import 'package:ja_demo/routes/clean_air_condition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Clean_Air_Condition_Page(),
    );
  }
}
