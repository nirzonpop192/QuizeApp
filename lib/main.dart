import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quize_app/Answer.dart';
import 'package:quize_app/Question.dart';

void main() =>
    runApp(
        new MyQuizPWidget()
    );

class MyQuizPWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new MyQuizPState();
//  @override
// State<StatefulWidget> createState() {
//   return new MyQuizPState();
// }
}


class MyQuizPState extends State<MyQuizPWidget> {

  late Timer _timer;
  static const int initial_second=30;

  // varible
  // initial_second=30
  // _start=initial_second;
  // _start=30;
  int _start=initial_second;
  // void startTimer() {
  //   const oneSec = const Duration(seconds: 1);
  //   _timer = new Timer.periodic(
  //     oneSec,
  //         (Timer timer) {
  //       if (_start == 0) {
  //         setState(() {
  //           timer.cancel();
  //         });
  //       } else {
  //         setState(() {
  //           _start--;
  //         });
  //       }
  //     },
  //   );
  // }





void startTime() {
  const interval = const Duration(seconds: 1);
  _timer = Timer.periodic(interval, (boldaTimer) {


      setState(() {
        if (_start==0)
        boldaTimer.cancel();
        else
          _start--;
      });


  });
}


int _questionIndex = 0;
// int _button_click=0;

List<Map<String, dynamic>>question = [

  {'qus': 'which one is right word ?',
    'ans': ['verb', 'nounes', 'pronoune']
  },
  {'qus': 'which one is programing language ?',
    'ans': ['Ms Word', 'Devioun', 'oracle', 'ADA']
  },
  {'qus': 'which one is OS ?',
    'ans': ['Ms Word', 'Devioun', 'kali', 'Android']
  }
];

@override
  void initState() {

  startTime();
    super.initState();
  }
void nextQuestion() {

  setState(() {
    // _start=30
    _start=initial_second;
    // ++_questionIndex;
    // _questionIndex=0+1 // 0 // 1 // 2
    // _questionIndex=1 // 1  // 2 // 3
    // 0 , 1, 2
    // 3
    // 0 < = 3 = true
    // 1 < = 3 = true
    // 2 < = 3 = true
    // 3 < = 3 = true
    // 4 < = 3 = false
    //_button_click++; //1
    if (_questionIndex < question.length - 1) { // true
      //_questionIndex=_questionIndex+1;  // increment // _questionIndex++
      ++_questionIndex;
    }
    else
      _questionIndex = 0;
  });

  startTime();
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Quiz"),),
      body: Column(
        children: [
          // if(_button_click!=0 &&_button_click<=question.length)
          Text(_start.toString(),style: TextStyle(fontSize: 28),),
           QuestionWidget(question[_questionIndex]['qus']),

          ...(question[_questionIndex]['ans'] as List).map(
                  (answer) {
                if (answer == "verb" || answer == "kali" || answer == "ADA")
                  return Answer(answer, nextQuestion, isItCorrect: true,);
                else
                  return Answer(answer, nextQuestion);
              }
          ),

          //ElevatedButton(onPressed: nextQuestion, child: Text("Next"))
        ],
      ),
    ),
  );
}}

