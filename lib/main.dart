import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Calculator",
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: homepage());
  }
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String val = "";
  String valtodisplay = "";
  void solveme() {
    Parser p = Parser();
    Expression exp = p.parse(val);
    ContextModel cm = ContextModel();
    String result = exp.evaluate(EvaluationType.REAL, cm).toString();
    setState(() {
      val = result;
      valtodisplay = "";
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
        child: OutlineButton(
            onPressed: () {
              if (btnval == "=") {
                solveme();
              } else if (btnval == "C") {
                setState(() {
                  val = "";
                  valtodisplay = "";
                });
              } else {
                val += btnval;
                valtodisplay = val;
              }
              setState(() {
                valtodisplay;
              });
            },
            padding: EdgeInsets.all(25.0),
            child: Text(
              "$btnval",
              style: TextStyle(
                fontSize: 20.0,
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Calculator")),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.bottomRight,
                child: Text("$valtodisplay",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300)),
              )),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.bottomRight,
                child: Text("$val",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300)),
              )),
              Row(
                children: [
                  custombutton("C"),
                  custombutton(""),
                  custombutton(""),
                  custombutton(""),
                ],
              ),
              Row(
                children: [
                  custombutton("7"),
                  custombutton("8"),
                  custombutton("9"),
                  custombutton("/"),
                ],
              ),
              Row(
                children: [
                  custombutton("4"),
                  custombutton("5"),
                  custombutton("6"),
                  custombutton("*"),
                ],
              ),
              Row(
                children: [
                  custombutton("1"),
                  custombutton("2"),
                  custombutton("3"),
                  custombutton("-"),
                ],
              ),
              Row(
                children: [
                  custombutton("."),
                  custombutton("0"),
                  custombutton("="),
                  custombutton("+"),
                  
                ],
              ),
            ],
          ),
        ));
  }
}
