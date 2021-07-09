import 'dart:async';
import 'package:controll_app/electricity.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'allView.dart';
import 'iotscreen.dart';
import 'guagse.dart';
import 'cam.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class plantSceen extends StatefulWidget {
  final String title;

  plantSceen({Key key, this.title}) : super(key: key);

  @override
  _plantPage createState() => _plantPage();
}

class _plantPage extends State<plantSceen> {
  allViewState aV = new allViewState();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  double _sliderValue = 0;
  int _counter = 0;
  double soil;
  static bool value = false;
  Timer _timer;
  int n1 = 0, n2, n3, n4, n5;
  final dbRef = FirebaseDatabase.instance.reference();
  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  void _startTimer() {
    //_counter = 0;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
          if(_counter == 0){
            value = false;
            writeData();
          }
        }

        else {
          _timer.cancel();
        }
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: aV.setAppbar('SoilMoisture'),
        drawer: aV.setDrawer(context),
        bottomNavigationBar: setBotom(context),
        floatingActionButton: aV.setFBotom(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: StreamBuilder(
              builder: (context, snapshot) {
                dbRef.child("Plantstate").set({"switch": value});
                if (snapshot.hasData &&
                    !snapshot.hasError &&
                    snapshot.data.snapshot.value != null) {
                  soil = snapshot.data.snapshot.value["Moisture:"];

                  soil -= 0.001;
                  return Scaffold(
                    body: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bg.jfif'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ListView(
                        children: <Widget>[
                          showValue(soil.toInt()),
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
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 48,
                                ),
                              ),
                            ],
                          ),
                          SfSliderTheme(
                            data: SfSliderThemeData(
                              activeLabelStyle: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic),
                              inactiveLabelStyle: TextStyle(
                                  color: Colors.blue[200],
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic),
                            ),
                            child: SfSlider(
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
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: const Offset(
                                        3.0,
                                        3.0,
                                      ), //Offset
                                      blurRadius: 7.5,
                                      spreadRadius: 1,
                                    ), //BoxShadow
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: const Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ), //BoxShadow
                                  ],
                                  //color: Colors.purple,
                                  gradient: new LinearGradient(
                                      colors: [
                                        Colors.pinkAccent,
                                        Colors.lightBlueAccent
                                      ],
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft),
                                ),
                                margin: const EdgeInsets.all(10),
                                height: 100,
                                width: 150,
                                child: RaisedButton(
                                  onPressed: () => {
                                    value = false,
                                    _startTimer(),onUpdate(),writeData(),
                                  },
                                  child: Text("เริ่มรดน้ำต้นไม้"),
                                ),
                              ),
                              Container(
                                decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: const Offset(
                                        3.0,
                                        3.0,
                                      ), //Offset
                                      blurRadius: 7.5,
                                      spreadRadius: 1,
                                    ), //BoxShadow
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: const Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ), //BoxShadow
                                  ],
                                  //color: Colors.purple,
                                  gradient: new LinearGradient(
                                      colors: [
                                        Colors.pinkAccent,
                                        Colors.lightBlueAccent
                                      ],
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft),
                                ),
                                margin: const EdgeInsets.all(10),
                                height: 100,
                                width: 150,
                                child: RaisedButton(
                                  onPressed: (){
                                    value = true;
                                    _stopTimer();
                                    onUpdate();
                                    readData();
                                    writeData();
                                  },
                                  child: Text("หยุดการรถน้ำต้นไม้"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else {}
                return Container();
              },
              stream: dbRef.child("Data").onValue),
        ),
      ),
    );
  }

  Future<void> readData() async {
    dbRef.child("Data").once().then(
      (DataSnapshot snapshot) {
        print(snapshot.value);
      },
    );
  }

  Future<void> writeData() async {
    dbRef.child("Plantstate").set({"switch": value});
  }
}

Widget setBotom(context) {
  return BottomAppBar(
    color: Colors.lightGreenAccent,
    child: Row(
      children: [
        IconButton(
          icon:
              Icon(CupertinoIcons.left_chevron, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => elecSceen()));
          },
          tooltip: 'Light',
        ),
        Spacer(),
        IconButton(
          icon: Icon(
            CupertinoIcons.right_chevron,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => IotScreen()));
          },
          tooltip: 'Humd & Temp',
        ),
      ],
    ),
  );
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final int sales;
}

Widget showValue(soil) {
  return Container(
    margin: const EdgeInsets.all(20),
    child: ligh(soil),
  );
}

Widget ligh(int t) {
  if (t > 80) {
    return Container(
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: const Offset(
              3.0,
              3.0,
            ), //Offset
            blurRadius: 7.5,
            spreadRadius: 1,
          ), //BoxShadow
          BoxShadow(
            color: Colors.black,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        //color: Colors.purple,
        gradient: new LinearGradient(
            colors: [Colors.lightGreenAccent, Colors.lightGreenAccent],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      height: 100,
      width: 320,
      //color: Colors.blue,
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
            '' + t.toString() + '%',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  } else if (t > 50) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: const Offset(
              3.0,
              3.0,
            ), //Offset
            blurRadius: 7.5,
            spreadRadius: 1,
          ), //BoxShadow
          BoxShadow(
            color: Colors.black,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        //color: Colors.purple,
        gradient: new LinearGradient(
            colors: [Colors.lightGreenAccent, Colors.lightBlueAccent],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      height: 100,
      width: 320,
      //color: Colors.blue,
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
            '' + t.toString() + '%',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  } else if (t > 25) {
    return Container(
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: const Offset(
              3.0,
              3.0,
            ), //Offset
            blurRadius: 7.5,
            spreadRadius: 1,
          ), //BoxShadow
          BoxShadow(
            color: Colors.black,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        //color: Colors.purple,
        gradient: new LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.redAccent],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      height: 100,
      width: 320,
      //color: Colors.blue,
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
            '' + t.toString() + '%',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  } else if (t < 26) {
    return Container(
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: const Offset(
              3.0,
              3.0,
            ), //Offset
            blurRadius: 7.5,
            spreadRadius: 1,
          ), //BoxShadow
          BoxShadow(
            color: Colors.black,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        //color: Colors.purple,
        gradient: new LinearGradient(
            colors: [Colors.redAccent, Colors.redAccent],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      height: 100,
      width: 320,
      //color: Colors.blue,
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
            '' + t.toString() + '%',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
