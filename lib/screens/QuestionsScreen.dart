import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/models/quiz_question.dart';
import 'package:quizapp/widgets/AnswerButton.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({super.key, required this.chooseAnswer});

  final Function(String selectedAnswer) chooseAnswer;


  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {


  var currentIndex = 0;



  @override
  Widget build(BuildContext context) {


    final QuizQuestion currentQuestion = questions[currentIndex];

    void nextQuestion(String answerText){
      widget.chooseAnswer(answerText);
      setState(() {
        currentIndex++;
      });
    }



    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(currentQuestion.text),
        ...currentQuestion.answers.map((answerText) => AnswerButton(answerText: answerText, onTap: nextQuestion,)),
      ],
    );
  }
}
