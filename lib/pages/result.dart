import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  static const id = '/result_screen';

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double result = 25.0;
  String state = "NORMAL";
  dynamic map = {};

  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    result = map['result'];
    return Scaffold();
  }
}
