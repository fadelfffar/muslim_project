// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class QuizField extends StatelessWidget {
  String choiceData;
  String quizTextData;
  QuizField({
    super.key,
    required this.choiceData,
    required this.quizTextData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)
        ),
        // color: Colors.greenAccent
      ),
      child: OutlinedButton(
        onPressed: () {  },
        child: Row(
          children: [
            Text(choiceData),
            const SizedBox(width: 24,),
            Text(quizTextData),
          ],
        ),
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Colors.greenAccent),
          side: WidgetStatePropertyAll(BorderSide(
            style: BorderStyle.solid,
          ))
        ),
      ),
    );
  }
}