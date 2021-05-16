import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function reset;
  final int totalScore;

  Result({this.reset, this.totalScore});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Text(
              "You are completed " + totalScore.toString(),
              style: TextStyle(fontSize: 36, color: Colors.green),
            ),
            FlatButton(child: Text("Home"), onPressed: reset),
          ],
        ),
        margin: EdgeInsets.all(20),
      ),
    );
  }
}
