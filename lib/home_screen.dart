import 'dart:math';

import 'package:bmi_starting/answer_screen.dart';
import 'package:bmi_starting/contants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreen> {
  Sex? selectedSex;
  double height = 175;
  int age = 20;
  int weight = 60;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    Flexible(
                      flex: 1,
                      child: Row(children: [
                        GenderButton(
                          isSelected: selectedSex == Sex.male ? true : false,
                          icon: const Icon(Icons.male,
                              size: 50, color: Colors.white),
                          onPressed: () =>
                              setState(() => selectedSex = Sex.male),
                        ),
                        const SizedBox(width: 16),
                        GenderButton(
                          isSelected: selectedSex == Sex.female ? true : false,
                          icon: const Icon(Icons.female,
                              size: 50, color: Colors.white),
                          onPressed: () =>
                              setState(() => selectedSex = Sex.female),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    Flexible(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: darkBlue,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text("HEIGHT",
                                        style: TextStyle(color: Colors.white)),
                                    const SizedBox(height: 8),
                                    RichText(
                                        text: TextSpan(
                                            style: const TextStyle(
                                                color: Colors.white),
                                            children: [
                                          TextSpan(
                                              text: height.toStringAsFixed(1),
                                              style: const TextStyle(
                                                  fontSize: 42,
                                                  fontWeight: FontWeight.bold)),
                                          const TextSpan(text: " cm")
                                        ])),
                                    const SizedBox(height: 16),
                                    Slider(
                                      activeColor: accentColor,
                                      thumbColor: accentColor,
                                      inactiveColor: Colors.grey.shade200,
                                      value: height,
                                      onChanged: (val) =>
                                          setState(() => height = val),
                                      max: 300,
                                      min: 100,
                                    ),
                                  ]),
                            ))),
                    const SizedBox(height: 16),
                    Flexible(
                      flex: 1,
                      child: Row(children: [
                        Counter(
                          title: "WEIGHT",
                          value: weight,
                          onIncrement: () => setState(() => weight++),
                          onDecrement: () => setState(() => weight--),
                        ),
                        const SizedBox(width: 16),
                        Counter(
                          title: "AGE",
                          value: age,
                          onIncrement: () => setState(() => age++),
                          onDecrement: () => setState(() => age--),
                        ),
                      ]),
                    )
                  ]),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: GestureDetector(
                    onTap: () {
                      final result = _calculateBMI(weight.toDouble(), height);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => AnswerScreen(
                              result: result,
                              bmi: _getBMI(weight.toDouble(), height))));
                    },
                    child: Container(
                        color: accentColor,
                        child: const Center(
                          child: Text("CALCULATE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ))),
              )
            ],
          )),
    );
  }
}

double _getBMI(double weight, double height) => weight / pow(height / 100, 2);

String _calculateBMI(double weight, double height) {
  double bmi = weight / pow(height / 100, 2);
  if (bmi < 18.5) {
    return 'Underweight';
  } else if (bmi >= 18.5 && bmi < 25) {
    return 'Normal';
  } else if (bmi >= 25 && bmi < 30) {
    return 'Overweight';
  } else {
    return 'Obese';
  }
}

class Counter extends StatelessWidget {
  const Counter(
      {Key? key,
      required this.title,
      required this.value,
      required this.onIncrement,
      required this.onDecrement})
      : super(key: key);

  final String title;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: darkBlue, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(title, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 8),
            Text(
              value.toString(),
              style: const TextStyle(
                  fontSize: 42,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: onDecrement,
                  child: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                    onTap: onIncrement,
                    child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ))),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  const GenderButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.isSelected = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: isSelected ? blueDark : darkBlue,
              borderRadius: BorderRadius.circular(15)),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
