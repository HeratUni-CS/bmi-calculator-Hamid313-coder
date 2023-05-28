import 'dart:math';

import 'package:bmi_starting/constants/consts.dart';
import 'package:bmi_starting/pages/result.dart';
import 'package:bmi_starting/widgets/bottom_button.dart';
import 'package:bmi_starting/widgets/select_gender.dart';
import 'package:bmi_starting/widgets/set_height.dart';
import 'package:bmi_starting/widgets/set_weight.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  static const routeName = '/input-screen';

  @override
  State<InputScreen> createState() => _InputScreenState();
}

enum Gender { male, female }

class _InputScreenState extends State<InputScreen> {
  Gender chosen = Gender.male;
  int height = 175;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Calculator"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SelectGenderWidget(
                  color: chosen == Gender.male ? ActiveColor : InActiveColor,
                  icon: Icons.male_rounded,
                  text: 'Male',
                  onPress: () {
                    setState(() {
                      chosen = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: SelectGenderWidget(
                  color: chosen == Gender.female ? ActiveColor : InActiveColor,
                  icon: Icons.female_rounded,
                  text: 'Female',
                  onPress: () {
                    setState(() {
                      chosen = Gender.female;
                    });
                  },
                ),
              )
            ],
          ),
          Expanded(
            child: SetHeigthWidget(
                height: height,
                onChangeSlider: (newValue) {
                  setState(() {
                    height = newValue.round();
                  });
                }),
          ),
          Row(
            children: [
              Expanded(
                  child: SetWeightWidget(
                counter: weight,
                text: 'WEIGHT',
                onSubstract: () {
                  setState(() {
                    weight--;
                  });
                },
                onAdd: () {
                  setState(() {
                    weight++;
                  });
                },
              )),
              Expanded(
                  child: SetWeightWidget(
                      counter: age,
                      text: 'AGE',
                      onAdd: () {
                        setState(() {
                          age++;
                        });
                      },
                      onSubstract: () {
                        setState(() {
                          age--;
                        });
                      }))
            ],
          ),
          BottomButtonWidget(
              text: 'CALCULATE',
              onTap: () {
                double result = (weight / pow(height / 100, 2));
                Navigator.pushNamed(context, ResultScreen.routeName,
                    arguments: {'result': result});
              }),
        ],
      )),
    );
  }
}
