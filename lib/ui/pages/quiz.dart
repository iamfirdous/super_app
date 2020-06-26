import 'package:flutter/material.dart';

const ROUTE_QUIZ_PAGE = '/quiz-page';

class QuizPage extends StatefulWidget {
  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
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
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'This is going to be a question that you\'ll need to answer!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: FlatButton(
                  color: Colors.green,
                  onPressed: () {},
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: FlatButton(
                  color: Colors.red,
                  onPressed: () {},
                  child: Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ...List.generate(20, (index) => Icon(
                    index.isEven ? Icons.check : Icons.close,
                    color: index.isEven ? Colors.green : Colors.red,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
