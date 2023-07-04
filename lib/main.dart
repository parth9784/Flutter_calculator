import 'package:calculator/splash.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main(){
  runApp(calculator());
}
class calculator extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home:splash(),

    );
  }
}
class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => homestate();
}

class homestate extends State<homepage> {

  var input = "";
  var output = "";
  var operation = "";

  Onbutclick(value) {
    if (value == "AC") {
      input = "";
      output = "";
    }
    else if (value == "<") {
      input = input.substring(0, input.length - 1);
    }
    else if (value == "=") {
      var userinput = input;
      userinput = input.replaceAll("X", "*");
      Parser par = Parser();
      Expression exp = par.parse(userinput);
      ContextModel cm = ContextModel();
      var fvalue = exp.evaluate(EvaluationType.REAL, cm);
      output = fvalue.toString();
    }
    else {
      input += value;
    }
    setState(() {

    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF435B66),
      body: Column(
        children: [
          Expanded(
            child:
            Container(color: Color(0xFF001C30),
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(input,
                    style: TextStyle(fontSize: 48, color: Color(0xFFFBFFDC)),),
                  SizedBox(
                    height: 20,
                  ),
                  Text(output,
                    style: TextStyle(fontSize: 38, color: Color(0xFFFBFFDC)),),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),),
          Row(
            children: [
              button(text: "AC",
                  tColor: Color(0xFFFF7B54),
                  buttonbg: Color(0xFF0A4D68)),
              button(text: "<",
                  buttonbg: Color(0xFF0A4D68),
                  tColor: Color(0xFFFF7B54)),
              button(text: "", buttonbg: Color(0xFF0A4D68)),
              button(text: "/",
                  buttonbg: Color(0xFF0A4D68),
                  tColor: Color(0xFFFF7B54)),
            ],
          ),
          Row(
            children: [
              button(text: "7", buttonbg: Color(0xFF0A4D68)),
              button(text: "8", buttonbg: Color(0xFF0A4D68)),
              button(text: "9", buttonbg: Color(0xFF0A4D68)),
              button(text: "X",
                  buttonbg: Color(0xFF0A4D68),
                  tColor: Color(0xFFFF7B54)),
            ],
          ),
          Row(
            children: [
              button(text: "4", buttonbg: Color(0xFF0A4D68)),
              button(text: "5", buttonbg: Color(0xFF0A4D68)),
              button(text: "6", buttonbg: Color(0xFF0A4D68)),
              button(text: "-",
                  buttonbg: Color(0xFF0A4D68),
                  tColor: Color(0xFFFF7B54)),
            ],
          ),
          Row(
            children: [
              button(text: "1", buttonbg: Color(0xFF0A4D68)),
              button(text: "2", buttonbg: Color(0xFF0A4D68)),
              button(text: "3", buttonbg: Color(0xFF0A4D68)),
              button(text: "+",
                  buttonbg: Color(0xFF0A4D68),
                  tColor: Color(0xFFFF7B54)),
            ],
          ),
          Row(
            children: [
              button(text: "%",
                  tColor: Color(0xFFFF7B54),
                  buttonbg: Color(0xFF0A4D68)),
              button(text: "0", buttonbg: Color(0xFF0A4D68)),
              button(text: ".",
                  buttonbg: Color(0xFF0A4D68),
                  tColor: Color(0xFFFF7B54)),
              button(
                  text: "=", buttonbg: Color(0xFFFF7B54), tColor: Colors.white),
            ],
          ),
        ],
      ),

    );
  }

  Widget button({
    text, tColor = Colors.white, buttonbg = Colors.indigo,
  }) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ), backgroundColor: buttonbg,
            ),
            onPressed: () => Onbutclick(text),
            child: Text(text, style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 20, color: tColor),),


          ),
        )
    );
  }
}