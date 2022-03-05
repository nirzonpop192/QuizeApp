import 'package:flutter/material.dart';
import 'package:quize_app/Answer.dart';
import 'package:quize_app/Question.dart';

void main()=> runApp(
  new MyQuizPWidget()
);

class MyQuizPWidget extends StatefulWidget{

  // @override
  // State<StatefulWidget> createState() => new MyQuizPState();
   @override
  State<StatefulWidget> createState() {
    return new MyQuizPState();
  }
}


class MyQuizPState extends State<MyQuizPWidget>{

  int _questionIndex=0;
 // int _button_click=0;

  List<Map<String,dynamic>>question=[

    {'qus':'which one is right word ?',
      'ans':['verb','nounes','pronoune']
    },
    {'qus':'which one is programing language ?',
      'ans':['Ms Word','Devioun','oracle','ADA']
    },
    {'qus':'which one is OS ?',
      'ans':['Ms Word','Devioun','kali','Android']
    }
  ];

  void nextQuestion(){
    setState(() {
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
      if (_questionIndex < question.length-1) {// true
        //_questionIndex=_questionIndex+1;  // increment // _questionIndex++
        ++_questionIndex;
      }
      else
        _questionIndex=0;
    });

  }
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar( title: Text("Quiz"),),
          body: Column(
            children: [
             // if(_button_click!=0 &&_button_click<=question.length)
              new QuestionWidget(question[_questionIndex]['qus']),

              ...(question[_questionIndex]['ans']as List).map(
                      (answer) {

                        if(answer=="verb" || answer=="kali"|| answer=="ADA")
                        return  Answer(answer,nextQuestion,isItCorrect: true,);
                        else
                        return  Answer(answer,nextQuestion);
                      }
              ),

              //ElevatedButton(onPressed: nextQuestion, child: Text("Next"))
            ],
          ),
        ),
      );
  }
}

