import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _sliderValue = 0;
  int _counter = 0;
  int soil = 25;
  Timer _timer;
  int n1 = 0, n2, n3, n4, n5;

  void _startTimer() {
    //_counter = 0;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }
  void _stopTimer() {
    setState(() {
      _counter=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer App"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            showValue(25),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (_counter > 0)
                    ? Text(
                  "  ",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                )
                    : Text(
                  "รดน้ำเสร็จแล้ว!",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
                Text(
                  '$_counter sec',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
              ],
            ),
            SfSlider(
              activeColor: Colors.red,
              inactiveColor: Colors.red[100],
              min: 0.0,
              max: 180.0,
              value: _counter.toDouble(),
              interval: 30,
              showLabels: true,
              onChanged: (dynamic newValue) {
                setState(() {
                  _counter = newValue.toInt();
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 100,
                  width: 150,
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () => _startTimer(),
                    child: Text("เริ่มรดน้ำต้นไม้"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 100,
                  width: 150,
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () => _stopTimer(),
                    child: Text("หยุดการรถน้ำต้นไม้"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final int sales;
}

Widget showValue( soil ) {
  return Container(
    margin: const EdgeInsets.only(top: 20, bottom: 40),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 100,
          width: 320,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ความชื้นในดิน',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                '$soil %',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
