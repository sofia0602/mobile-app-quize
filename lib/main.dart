import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Яка ви людина?',
      'answers': [
        {'text': 'Ви любите складати план і слідувати йому', 'score': 30},
        {'text': 'У вас дуже багато енергії та оптимізму', 'score': 5},
        {'text': 'Ви тактичні та ввічливі з іншими', 'score': 20},
        {
          'text': 'Ви любите приймати виклики, щоп показати на що здатні',
          'score': 10
        },
      ],
    },
    {
      'questionText': 'Відносини з іншими',
      'answers': [
        {
          'text':
              'Легко підлаштовуєтесь під людей, рідко відчуваєте потребу відстоювати правоту',
          'score': 20
        },
        {'text': 'Нетерпеливі з іншими, робите по своєму', 'score': 10},
        {
          'text': 'Любите вести довгі розмірені бесіди замість пустих балачок',
          'score': 30
        },
        {'text': 'Що думаєте, те говорите, завжди відверті', 'score': 5},
      ],
    },
    {
      'questionText': 'З якими труднощами найчастіше стикаєтесь?',
      'answers': [
        {'text': 'Вам важко догодити, злопам`ятні', 'score': 10},
        {'text': 'Вам важко приймати рішення', 'score': 10},
        {'text': 'Вам важко показувати почуття іншим', 'score': 30},
        {'text': 'Вам важко виконувати рутинну роботу', 'score': 5},
      ],
    },
    {
      'questionText': 'Охарактеризуйте себе в роботі',
      'answers': [
        {'text': 'Трудоголік, постійно прагнете кар`єрного росту', 'score': 10},
        {'text': 'Організовані, акуратні, прискіпливі до деталей', 'score': 30},
        {'text': 'Легко відволікаєтесь, вам швидко все набридає', 'score': 5},
        {'text': 'Ви терпеливий і спокійний', 'score': 20},
      ],
    },
    {
      'questionText': 'Соціальна активність',
      'answers': [
        {'text': 'Ви любите бути на одинці', 'score': 20},
        {
          'text': 'Ви любите подобатись іншим і стараєткесь для цього',
          'score': 5
        },
        {'text': 'Ви незалежні від чужої думки і довіряєте собі', 'score': 10},
        {
          'text':
              'Добрі, будь яку активність оцінюєте, як виграш у маййбутньому',
          'score': 30
        },
      ],
    },
    {
      'questionText': 'Ваш характер',
      'answers': [
        {'text': 'Невпевненість, внутрішні проблеми, неспокій', 'score': 20},
        {'text': 'Настрій постійно змінюється', 'score': 5},
        {
          'text': 'Намагаєтесь мислити позитивно, але інколи не виходить',
          'score': 30
        },
        {'text': 'Буваєте впертими', 'score': 10},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Тест на темперамент'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
