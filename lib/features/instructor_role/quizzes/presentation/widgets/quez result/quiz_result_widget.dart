import 'package:flutter/material.dart';

class QuizResultWidget extends StatelessWidget {
  const QuizResultWidget({super.key,required this.quizGrade});
  final int quizGrade;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         const Text('Finished!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                  ),),
                  const Text(' Answers have been sent successfully',
                    style: TextStyle(
                        fontSize: 15
                    ),),
                  const SizedBox(height: 100,),
                   Text('Your Points :',
                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                     fontSize: 25,
                   ),
                   ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children:[ Image.asset(
                             'assets/images/check1.png',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0,bottom: 20),
                        child: Text('$quizGrade',style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 50
                        ),),
                      ),
                      ]),
                  ),
                 
      ],
    );
  }
}