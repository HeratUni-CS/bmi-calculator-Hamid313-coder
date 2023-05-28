import 'package:flutter/material.dart';

import 'add_subtract_input.dart';

class SetWeightWidget extends StatelessWidget {
  const SetWeightWidget({
    Key? key,
    required this.counter,
    required this.text,
    required this.onSubstract,
    required this.onAdd,
  }) : super(key: key);

  final int counter;
  final String text;
  final Function() onSubstract;
  final Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 29, 30, 51),
          borderRadius: BorderRadius.circular(10)),
      child: AddSubtractInputWidget(
        text: text,
        counter: counter,
        stateSubstract: onSubstract,
        stateAdd: onAdd,
      ),
    );
  }
}
