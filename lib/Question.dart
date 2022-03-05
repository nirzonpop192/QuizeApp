import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget{


    String questionString="";
  QuestionWidget(String _questionString){
    questionString=_questionString;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 400,
      child: Text(questionString,
        style: TextStyle(
            color: Colors.white,
            fontSize: 28
        ),

      ),
      decoration: BoxDecoration(
          color: Colors.purple,
          boxShadow: [
            BoxShadow(color:Colors.black45,blurRadius: 10,offset: Offset.fromDirection(0.25*3.1416,10))
          ]
      ),
    );
  }
}

