import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        // physics: ,
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                CircleAvatar(
                  backgroundColor: data['user_answer'] == data['correct_answer']
                      ? const Color.fromARGB(255, 26, 198, 250)
                      : const Color.fromARGB(217, 237, 84, 138),
                  child: Text(
                    ((data["question_index"] as int) + 1).toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question_text'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(
                              color: const Color.fromARGB(226, 251, 45, 199),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 26, 198, 250),
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
