import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({Key? key, required this.answerText, required this.onTap})
      : super(key: key);

  String answerText;
  final Function(String answerText) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(answerText);
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        surfaceTintColor: Colors.grey,
        child: Container(
          height: 60,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              answerText,
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont('Play', fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
