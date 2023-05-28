import 'package:flutter/material.dart';

import 'add_subtract_input.dart';

class SetWeightWidget extends StatelessWidget {
  const SetWeightWidget({
    Key? key,
    required this.counter,
    required this.text,
    required this.onPressedSubstract,
    required this.onPressedAdd,
  }) : super(key: key);

  final int counter;
  final String text;
  final Function() onPressedSubstract;
  final Function() onPressedAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10)),
      child: SubstractAddInputWidget(
        text: text,
        counter: counter,
        stateSubstract: onPressedSubstract,
        stateAdd: onPressedAdd,
      ),
    );
  }
}
