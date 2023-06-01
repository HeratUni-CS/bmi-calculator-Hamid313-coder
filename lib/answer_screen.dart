import 'package:bmi_starting/contants.dart';
import 'package:flutter/material.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({Key? key, required this.result, required this.bmi})
      : super(key: key);
  static const routeName = '/result-screen';
  final String result;
  final double bmi;

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  String get resultMessage {
    if (widget.result == "Underweight") return "Your body is not good!";
    if (widget.result == "Overweight") return "You have a heavy body!";
    return "Your are in a good shape!";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Your Result",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 42)),
                        const SizedBox(height: 32),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: darkBlue,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(children: [
                              const Spacer(),
                              Text(widget.result,
                                  style: const TextStyle(
                                      color: lightGreen,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              const Spacer(),
                              Text(widget.bmi.toStringAsFixed(1),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 42,
                                      fontWeight: FontWeight.bold)),
                              const Spacer(),
                              Text(resultMessage,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 24)),
                              const Spacer(),
                            ]),
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                        color: accentColor,
                        child: const Center(
                          child: Text("RE-CALCULATE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ))),
              )
            ],
          )),
    );
  }
}
