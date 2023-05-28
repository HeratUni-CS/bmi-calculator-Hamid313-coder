import 'package:bmi_starting/pages/input.dart';
import 'package:bmi_starting/pages/result.dart';
import 'package:bmi_starting/themes/darkTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Color(0xFF0A0E21)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme(),
      initialRoute: InputScreen.id,
      routes: {
        InputScreen.id: (context) => const InputScreen(),
        ResultScreen.id: (context) => const ResultScreen(),
      },
    );
  }
}
