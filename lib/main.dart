import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What your favorite color?",
      "answerText": [
        {"text":"Black", "score" : 10},
        {"text":"Red", "score" : 5},
        {"text":"Green", "score" : 3},
        {"text":"White", "score" : 1}
      ],
    },
    {
      "questionText": "What your favorite animal?",
      "answerText": [
        {"text":"Lion", "score" : 10},
        {"text":"Elephant", "score" : 5},
        {"text":"Goat", "score" : 3},
        {"text":"Rabbit", "score" : 1}
      ],
    },
    {
      "questionText": "What your favorite bird?",
      "answerText": [
        {"text":"Eagle", "score" : 10},
        {"text":"Crow", "score" : 5},
        {"text":"Parrot", "score" : 3},
        {"text":"Kuruvi", "score" : 1}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int answer) {    
    setState(() {
      _questionIndex = _questionIndex + 1;
      _totalScore += answer;
    });
    print("Answer clicked " + answer.toString() + "|" + _totalScore.toString());
  }

  void _reset() {
    print("Reset pressed ");   
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions : _questions, 
                questionIndex : _questionIndex, 
                answerQuestion : _answerQuestion
              )
            : Result(reset : _reset, totalScore : _totalScore),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
