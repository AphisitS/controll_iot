import 'dart:ffi';

import 'package:flutter/material.dart';
import 'CircleProgress.dart';
import 'iotscreen.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Circle Progress'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  CircleProgressState createState() => CircleProgressState();
}

class CircleProgressState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  AnimationController progressController;
  Animation<double> animation;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    progressController = AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    animation = Tween<double>(begin: 70.2 ,end: 0).animate(progressController)..addListener((){
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: CustomPaint(
          foregroundPainter: CircleProgress(animation.value.toDouble()),

          // this will add custom painter after child
          child: Container(
            width: 200,
            height: 200,
            child: GestureDetector(
                onTap: (){
                  if(animation.value == 80){
                    progressController.reverse();
                  }else {
                    progressController.forward();
                  }
                },
                child: Center(child: Text("${animation.value} %",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),))),
          ),

        ),

      ),

    );
  }
}



