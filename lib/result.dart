import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 10 && resultScore < 120) {
      resultText = 'Ви Сангвінік!';
    } else if (resultScore < 30) {
      resultText = 'Ви Холерик!';
    } else if (resultScore >= 30 && resultScore <= 120) {
      resultText = 'Ви Меланхолік!';
    } else {
      resultText = 'Ви Флегматик!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.green,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
