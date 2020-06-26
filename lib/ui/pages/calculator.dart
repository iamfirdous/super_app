import 'package:flutter/material.dart';

const ROUTE_CALCULATOR = '/calculator';

class CalculatorPage extends StatefulWidget {
  @override
  CalculatorPageState createState() => CalculatorPageState();
}

class CalculatorPageState extends State<CalculatorPage> {
  List<String> output = [];

  Widget _getButton({
    @required String text,
    Color color = Colors.black,
  }) {
    return Expanded(
      child: InkResponse(
        onTap: () => setState(() => output.insert(0, text)),
        child: Container(
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getNumberRow({@required List<String> numbers}) {
    return Expanded(
      child: Row(
        children: <Widget>[for (var item in numbers) _getButton(text: item)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 24.0, 24.0, 0.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  children: <Widget>[
                    for (var item in output)
                      Text(item, style: TextStyle(fontSize: 42.0, letterSpacing: 4.0),)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 28,
                    child: Column(
                      children: <Widget>[
                        _getNumberRow(numbers: ['7', '8', '9']),
                        _getNumberRow(numbers: ['4', '5', '6']),
                        _getNumberRow(numbers: ['1', '2', '3']),
                        _getNumberRow(numbers: ['0', '.', '=']),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: InkResponse(
                            onTap: () => setState(() => output.removeAt(0)),
                            onLongPress: () => setState(() => output.clear()),
                            child: Icon(
                              Icons.backspace,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        _getButton(text: '÷', color: Colors.blue),
                        _getButton(text: '×', color: Colors.blue),
                        _getButton(text: '-', color: Colors.blue),
                        _getButton(text: '+', color: Colors.blue),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.blueAccent,
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
