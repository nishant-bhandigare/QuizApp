import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key, required this.startQuiz});

  final Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Text("StartScreen"),
          Image.asset(
            "assets/images/test.png",
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.05),
          Text(
            'Quizzles',
            style: GoogleFonts.getFont('Press Start 2P', fontSize: 25),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          GestureDetector(
            onTap: () {
              startQuiz();
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                // color: const Color.fromRGBO(39, 0, 93, 1.0),
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(98, 161, 255, 1.0),
                    Color.fromRGBO(156, 98, 255, 1),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  "Start Quiz",
                  style: GoogleFonts.getFont('Play', fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
