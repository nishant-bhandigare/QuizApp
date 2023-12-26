import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/widgets/QuestionsSummary.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.restartQuiz, required this.selectedAnswers});
  final Function() restartQuiz;
  final List<String> selectedAnswers;

  int result() {
    int score = 0;
    for (int i = 0; i < selectedAnswers.length; i++) {
      if (selectedAnswers[i] == questions[i].answers[0]) {
        score++;
      }
    }
    return score;
  }

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];


    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': selectedAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    final partition = 360/questions.length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: SfRadialGauge(
            enableLoadingAnimation: true,
            axes: <RadialAxis>[
              RadialAxis(
                startAngle: -90,
                endAngle: (partition*result())-90,
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
                      result().toString(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        QuestionsSummary(summaryData),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              restartQuiz();
            },
            child: const Text("Restart Quiz")),
      ],
    );
  }
}
