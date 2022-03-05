
import 'package:flutter/material.dart';

class Answer extends StatelessWidget{

  VoidCallback? onPressListener=null;
  String _label="";
  bool isItCorrect=false;
  // constructer
  Answer(String label, onPressListener,{ isItCorrect}){
    _label=label;
    this.onPressListener=onPressListener;
    //
    isItCorrect??=false;
    // if (isEnable== null)
    // isEnable= true
    // else isEnable=isEnable
    this.isItCorrect=isItCorrect;
  }

//  String get label => null;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressListener,
        child: Text(_label),
      style: isItCorrect?   ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green)
      ):
      ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue)
      )
      ,
    );
  }

}