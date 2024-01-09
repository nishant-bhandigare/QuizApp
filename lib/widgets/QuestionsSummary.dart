import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {Key? key}) : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return _buildSummaryRow(data);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(Map<String, Object> data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIndexCircle(data['question_index'] as int),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText(data['question'] as String, 15, FontWeight.bold),
              const SizedBox(height: 10),
              _buildText(data['user_answer'] as String, null, null, const Color.fromRGBO(
                  148, 90, 255, 1.0),),
              const SizedBox(height: 10),
              _buildText(data['correct_answer'] as String, null, null, const Color.fromRGBO(
                  36, 180, 255, 1.0),),
              const SizedBox(height:30),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIndexCircle(int? questionIndex) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(195, 161, 255, 1.0),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          ((questionIndex ?? 0) + 1).toString(),
          style: GoogleFonts.getFont('Play', fontSize: 15),
        ),
      ),
    );
  }

  Widget _buildText(String text, double? fontSize, FontWeight? fontWeight, [Color? color]) {
    return Text(
      text,
      style: GoogleFonts.getFont('Play',color: color, fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}
