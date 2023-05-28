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
    return Container();
  }
}
