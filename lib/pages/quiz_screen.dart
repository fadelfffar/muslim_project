import 'package:flutter/material.dart';
import 'package:muslim_project/widgets/quiz_field.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Muslim Hadits Quiz'),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          alignment: Alignment.center,
          child: Container(
            height: 500,
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white38
            ),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing"),
                Container(
                  height: 400,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      QuizField(choiceData: "A", quizTextData: "Inflasi"),
                      SizedBox(height: 10,),
                      QuizField(choiceData: "A", quizTextData: "Inflasi"),
                      SizedBox(height: 10,),
                      QuizField(choiceData: "A", quizTextData: "Inflasi"),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}