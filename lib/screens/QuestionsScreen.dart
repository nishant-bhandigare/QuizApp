import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final partition = 360 / questions.length;
    var degree = partition * (currentIndex + 1);

    void nextQuestion(String answerText) {
      widget.chooseAnswer(answerText);
      setState(() {
        currentIndex++;
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: const Color.fromRGBO(156, 98, 255, 1),
            borderRadius: BorderRadius.circular(15.0),
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(98, 161, 255, 1.0),
                Color.fromRGBO(156, 98, 255, 1),
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 25),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: SfRadialGauge(
                  enableLoadingAnimation: false,
                  axes: <RadialAxis>[
                    RadialAxis(
                      startAngle: -90,
                      endAngle: 270,
                      showLabels: false,
                      showTicks: false,
                      axisLineStyle: const AxisLineStyle(
                        color: Colors.white,
                        thickness: 10,
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                    ),
                    RadialAxis(
                      startAngle: -90,
                      endAngle: degree - 90,
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
                            "${currentIndex + 1}/${questions.length}",
                            style: GoogleFonts.getFont('Play', fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: Text(
                    currentQuestion.text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Play', fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        ...currentQuestion
            .getShuffledAnswers()
            .map((answerText) => AnswerButton(
                  answerText: answerText,
                  onTap: nextQuestion,
                )),
      ],
    );
  }
}
