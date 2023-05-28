import 'package:bmi_starting/constants/consts.dart';
import 'package:flutter/material.dart';

class AddSubtractInputWidget extends StatelessWidget {
  const AddSubtractInputWidget(
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyleGlobal,
          ),
          Text(
            '$counter',
            style: TextStyleNumbers,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  heroTag: null,
                  backgroundColor: const Color(0xFF8D8E98),
                  onPressed: stateSubstract,
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                  heroTag: null,
                  backgroundColor: const Color(0xFF8D8E98),
                  onPressed: stateAdd,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
