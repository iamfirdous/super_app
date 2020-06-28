import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:super_app/util/quiz_brain.dart';

const ROUTE_QUIZ_PAGE = '/quiz-page';

class QuizPage extends StatefulWidget {
  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain;
  List<bool> scoreKeeper = [];
  int score = 0;

  void addScore(bool userAnswer) {
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: 'Quiz finished',
          desc: 'And your score is $score',
          buttons: [
            DialogButton(
              child: Text(
                'Okay',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
          type: AlertType.success,
          style: AlertStyle(
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            isCloseButton: false,
          ),
        ).show();

        quizBrain.reset();
        scoreKeeper = [];
        score = 0;
        return;
      }
      var isCorrect = userAnswer == quizBrain.getAnswer();
      scoreKeeper.add(isCorrect);
      score += isCorrect ? 1 : 0;
      quizBrain.nextQuestion();
    });
  }

  Widget getButton(bool isTrue) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FlatButton(
          color: isTrue ? Colors.green : Colors.red,
          onPressed: () => addScore(isTrue),
          child: Text(
            isTrue ? 'True' : 'False',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        brightness: Brightness.dark,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[900]),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    quizBrain.getQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                  ),
                ),
              ),
            ),
            getButton(true),
            getButton(false),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  children: scoreKeeper.map((e) {
                    return Icon(
                      e ? Icons.check : Icons.close,
                      color: e ? Colors.green : Colors.red,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    quizBrain  = QuizBrain();
  }
}
