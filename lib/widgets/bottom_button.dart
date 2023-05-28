import 'package:flutter/material.dart';

class BottomButtonWidget extends StatelessWidget {
  const BottomButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        color: const Color(0xFFEB1555),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
