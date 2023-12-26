import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/screens/QuestionsScreen.dart';
import 'package:quizapp/screens/ResultsScreen.dart';
import 'package:quizapp/screens/StartScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void startQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(startQuiz: startQuiz);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(restartQuiz: restartQuiz, selectedAnswers: selectedAnswers);
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: screenWidget,
      ),
    );
  }
}
