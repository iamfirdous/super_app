import 'package:super_app/models/qna.dart';

class QuizBrain {

  int _qNumber = 0;

  List<QnA> _questions = [
    QnA(q: 'Some cats are actually allergic to humans', a: true),
    QnA(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    QnA(q: 'Approximately one quarter of human bones are in the feet.', a: true),
    QnA(q: 'A slug\'s blood is green.', a: true),
    QnA(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    QnA(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    QnA(q: 'No piece of square dry paper can be folded in half more than 7 times.', a: false),
    QnA(q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', a: true),
    QnA(q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', a: false),
    QnA(q: 'The total surface area of two human lungs is approximately 70 square metres.', a: true),
    QnA(q: 'Google was originally called \"Backrub\".', a: true),
    QnA(q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', a: true),
    QnA(q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', a: true),
    QnA(q: 'Abraham Lincoln had no middle name', a: true),
    QnA(q: 'Germany drinksthemost beerin theworld per person', a: false),
    QnA(q: 'Nemo is a puffer fish', a: false),
    QnA(q: 'Cows sleep standing up', a: true),
    QnA(q: 'Barack Obama’s favorite app is Candy Crush Saga', a: false)
  ];

  void nextQuestion() => _qNumber += isFinished() ? 0 : 1;

  String getQuestion() => _questions[_qNumber].q;

  bool getAnswer() => _questions[_qNumber].a;

  bool isFinished() => _qNumber >= _questions.length - 1;

  void reset() => _qNumber = 0;
}