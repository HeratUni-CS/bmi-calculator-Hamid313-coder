import 'package:bmi_starting/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  static const routeName = '/result-screen';

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double result = 25.0;
  String state = "NORMAL";
  dynamic map = {};

  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    result = map['result'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 32,
            ),
            child: Text(
              "Your Result",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 200,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result >= 25
                        ? "OVERWEIGHT"
                        : result > 18
                            ? "NORMAL"
                            : "UNDERWEIGHT",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 20, 165, 85),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    result.toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 98, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      result >= 25
                          ? "You have a higher than normal body weight. Try to exercize more."
                          : result > 18
                              ? "You have a normal body weight. Good job!"
                              : "You have a lower than normal body weight. You can eat a bit more.",
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )),
            ),
          ),
          BottomButtonWidget(
              onTap: () => Navigator.pop(context), text: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
