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
      child: Container(),
    );
  }
}
