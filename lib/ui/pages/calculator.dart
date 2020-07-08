import 'package:flutter/material.dart';
import 'package:super_app/ui/pages/calculator_secret.dart';
import 'package:super_app/ui/widgets/calc_button.dart';

const ROUTE_CALCULATOR = '/calculator';

class CalculatorPage extends StatefulWidget {
  @override
  CalculatorPageState createState() => CalculatorPageState();
}

class CalculatorPageState extends State<CalculatorPage> {
  List<String> input = [];
  String output = '';
  String phoneNumber = '';

  List<List<String>> numberButtons = [
    ['7', '8', '9'],
    ['4', '5', '6'],
    ['1', '2', '3'],
    ['0', '.', '='],
  ];

  List<String> operators = ['÷', '×', '-', '+'];

  void getPhoneNumber() async {
    phoneNumber = await Navigator.of(context).pushNamed(ROUTE_CALCULATOR_SECRET) as String;
    phoneNumber = phoneNumber != null ? phoneNumber.replaceAll(RegExp('[^0-9]'), '') : '';
    phoneNumber = phoneNumber.replaceAllMapped(
      new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 92.0,
                    padding: const EdgeInsets.only(top: 24.0, right: 24.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      children: <Widget>[
                        for (var item in input)
                          Text(
                            item,
                            style: TextStyle(
                              fontSize: 42.0,
                              letterSpacing: 4.0,
                            ),
                          )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Text(
                      output,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ],
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
                        for (var row in numberButtons)
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                for (var n in row)
                                  Expanded(
                                    child: CalcButton(
                                      onTap: () => setState(() {
                                        if (n == '=') {
                                          input.clear();
                                          input.insert(0, phoneNumber);
                                        } else {
                                          input.insert(0, n);
                                        }
                                      }),
                                      onLongPress: () => n == '=' ? getPhoneNumber() : '',
                                      child: Text(
                                        n,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: CalcButton(
                            onTap: () => setState(() => input.removeAt(0)),
                            onLongPress: () => setState(() => input.clear()),
                            child: Icon(
                              Icons.backspace,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        for (var text in operators)
                          Expanded(
                            child: CalcButton(
                              onTap: () => setState(() => input.insert(0, text)),
                              onLongPress: () async {
                                if (text == '=') {
                                  phoneNumber = await Navigator.of(context)
                                      .pushNamed(ROUTE_CALCULATOR_SECRET);
                                }
                              },
                              child: Text(
                                text,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
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
