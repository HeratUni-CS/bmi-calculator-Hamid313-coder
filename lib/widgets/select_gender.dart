import 'package:bmi_starting/constants/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget(
      {Key? key,
      required this.color,
      required this.icon,
      required this.text,
      required this.onPress})
      : super(key: key);

  final Color color;
  final IconData icon;
  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 210,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 78,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyleGlobal,
            )
          ],
        ),
      ),
    );
  }
}
