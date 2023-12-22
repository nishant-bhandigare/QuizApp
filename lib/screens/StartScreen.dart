import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key, required this.startQuiz});

  final Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("StartScreen"),
          ElevatedButton(onPressed: (){
            startQuiz();
          }, child: const Text("Start Quiz")),
        ],
      ),
    );
  }
}
