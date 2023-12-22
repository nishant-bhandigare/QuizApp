import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({super.key, required this.answerText, required this.onTap});

  String answerText;
  final Function(String answerText) onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap(answerText);
      },
      child: Text(answerText),
    );
  }
}
