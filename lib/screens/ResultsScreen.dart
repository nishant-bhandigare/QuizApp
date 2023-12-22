import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.restartQuiz});
  final Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("ResultsScreen"),
        TextButton(
          onPressed: restartQuiz,
          child: Text("Restart Quiz"),
        ),
      ],
    );
  }
}
