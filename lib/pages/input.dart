import 'dart:math';

import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  static const id = '/input_screen';

  @override
  State<InputScreen> createState() => _InputScreenState();
}

enum Gender { male, female }

class _InputScreenState extends State<InputScreen> {
  Gender selectedGender = Gender.male;
  int height = 175;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
    );
  }
}
