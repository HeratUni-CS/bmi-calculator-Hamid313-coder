import 'package:flutter/material.dart';

class SubstractAddInputWidget extends StatelessWidget {
  const SubstractAddInputWidget(
      {Key? key,
      required this.text,
      required this.counter,
      required this.stateSubstract,
      required this.stateAdd})
      : super(key: key);

  final String text;
  final int counter;
  final Function() stateSubstract;
  final Function() stateAdd;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("hello"));
  }
}
