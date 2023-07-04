import 'dart:async';
import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
class splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return splashstate();
  }
}
class splashstate extends State<splash>{
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),()=> Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => homepage(),)));
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF577D86),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Calculator",style:TextStyle(fontSize: 40,color:Color(0xFFECF8F9),fontFamily: 'satisfy'),),
            SizedBox(
              height:7
            ),
            Text("Developed by PD",style:TextStyle(fontSize: 15,color:Color(0xFFECF8F9),fontFamily:'satisfy',)
            ),],
        ),
      ),
    );
    }

  }