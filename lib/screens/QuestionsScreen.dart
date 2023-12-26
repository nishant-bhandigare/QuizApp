import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/models/quiz_question.dart';
import 'package:quizapp/widgets/AnswerButton.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
    final partition = 360/questions.length;
    var degree = partition*(currentIndex+1);

    void nextQuestion(String answerText) {
      widget.chooseAnswer(answerText);
      setState(() {
        currentIndex++;
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          // width: 100,
          height: MediaQuery.of(context).size.height*0.15,
          child: SfRadialGauge(enableLoadingAnimation: true, axes: <RadialAxis>[
            RadialAxis(
                startAngle: -90,
                endAngle: degree-90,
                showLabels: false,
                showTicks: false,
                axisLineStyle: const AxisLineStyle(
                  color: Colors.orangeAccent,
                  thickness: 10,
                  cornerStyle: CornerStyle.bothCurve,
                ),
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      angle: 90,
                      positionFactor: 0.15,
                      widget: Text(
                        "${currentIndex+1}/${questions.length}"
                      ))
                ])
          ]),
        ),
        const SizedBox(height: 25),
        Container(
          height: MediaQuery.of(context).size.height*0.1,
          // decoration: BoxDecoration(border: Border.all()),
          child: Center(
            child: Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        const SizedBox(height: 25),
        ...currentQuestion.getShuffledAnswers().map((answerText) => AnswerButton(
              answerText: answerText,
              onTap: nextQuestion,
            )),
      ],
    );
  }
}
