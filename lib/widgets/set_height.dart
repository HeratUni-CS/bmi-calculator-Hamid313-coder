import 'package:bmi_starting/constants/consts.dart';
import 'package:flutter/material.dart';

class SetHeigthWidget extends StatelessWidget {
  const SetHeigthWidget({
    Key? key,
    required this.height,
    required this.onChangeSlider,
  }) : super(key: key);

  final int height;
  final Function(double newValue) onChangeSlider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "HEIGHT",
            style: TextStyleGlobal,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              Text(
                "$height",
                style: TextStyleNumbers,
              ),
              const Text(
                "cm",
                style: TextStyleGlobal,
              ),
            ],
          ),
          Slider(
            value: height.toDouble(),
            onChanged: onChangeSlider,
            activeColor: const Color(0xFFEB1555),
            inactiveColor: const Color(0xFF8D8E98),
            min: 120,
            max: 220,
          )
        ],
      ),
    );
  }
}
