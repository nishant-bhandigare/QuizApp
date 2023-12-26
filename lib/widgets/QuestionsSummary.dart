// import 'package:flutter/material.dart';
//
// class QuestionsSummary extends StatelessWidget {
//   const QuestionsSummary(this.summaryData, {super.key});
//
//   final List<Map<String, Object>> summaryData;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height*0.5,
//       child: SingleChildScrollView(
//         child: Column(
//           children: summaryData.map(
//                 (data) {
//               return Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: 30,
//                     height: 30,
//                     decoration: BoxDecoration(
//                         color: Colors.purpleAccent,
//                         borderRadius: BorderRadius.circular(100)),
//                     child: Center(
//                       child: Text(
//                         ((data['question_index'] as int) + 1).toString(),
//                         style: const TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//
//                         Text(
//                           data['question'] as String,
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//
//                         const SizedBox(
//                           height: 5,
//                         ),
//
//                         Text(
//                           data['user_answer'] as String,
//                           style: const TextStyle(
//                             color: Colors.lightBlueAccent,
//                           ),
//                         ),
//
//                         Text(
//                           data['correct_answer'] as String,
//                           style: const TextStyle(
//                             color: Colors.amber,
//                           ),
//                         ),
//
//                         const SizedBox(
//                           height: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ).toList(),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

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
              const SizedBox(height: 5),
              _buildText(data['user_answer'] as String, null, null, Colors.lightBlueAccent),
              _buildText(data['correct_answer'] as String, null, null, Colors.amber),
              const SizedBox(height:35),
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
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          ((questionIndex ?? 0) + 1).toString(),
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text, double? fontSize, FontWeight? fontWeight, [Color? color]) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
