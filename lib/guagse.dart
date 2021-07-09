import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'allView.dart';
import 'iotscreen.dart';
import 'cam.dart';

final List<String> items = List<String>.generate((20), (index) => "Item : ${++index}");

class guagseScreen extends StatefulWidget {
  guagseScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<guagseScreen> {
  @override
  final dbRef = FirebaseDatabase.instance.reference();
  double t ;
  double h;
  allViewState aV = new allViewState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: aV.setAppbar('Humd&Temp'),
        drawer: aV.setDrawer(context),
        bottomNavigationBar: setBotom(context),
        floatingActionButton: aV.setFBotom(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: StreamBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    !snapshot.hasError &&
                    snapshot.data.snapshot.value != null) {
                  t = snapshot.data.snapshot.value["Temperature:"];
                  h = snapshot.data.snapshot.value["Humidity:"];
                  //h -= 0.001;
                  //t -= 0.001;
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg.jfif'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListView(children: <Widget>[
                      gaugeSection(t, h),
                      bodySection(t, h),
                    ]),
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
    dbRef.child("Data").once().then((DataSnapshot snapshot) {
      print(snapshot.value);
    });
  }
}

Widget gaugeSection(double h, double t) {
  return Container(
    padding: const EdgeInsets.all(30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: [
            Container(
              width: 300,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(30),
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
                    colors: [Colors.lightGreenAccent, Colors.pinkAccent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
              child: SfRadialGauge(
                enableLoadingAnimation: true,
                animationDuration: 3000,
                backgroundColor: Colors.white24,
                axes: <RadialAxis>[
                  RadialAxis(
                    radiusFactor: 0.80,
                    interval: 20,
                    minimum: 0,
                    maximum: 100,
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: t,
                        width: 0.08,
                        sizeUnit: GaugeSizeUnit.factor,
                        gradient: const SweepGradient(colors: <Color>[
                          Color(0xFff44336),
                          Colors.lightGreenAccent,
                          Color(0xff2196f3),
                        ], stops: <double>[
                          0.25,
                          0.60,
                          0.70,
                        ]),
                      ),
                    ],
                    //colors: <Color>[Color(0xFFCC2B5E), Color(0xFF753A88)],
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.08,
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                  ),
                  RadialAxis(
                    interval: 10,
                    minimum: 0,
                    maximum: 50,
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: h,
                        width: 0.1,
                        sizeUnit: GaugeSizeUnit.factor,
                        gradient: const SweepGradient(colors: <Color>[
                          Color(0xff2196f3),
                          Color(0xff00df2a),
                          Color(0xffffa500),
                          Color(0xffff3d00)
                        ], stops: <double>[
                          0.30,
                          0.50,
                          0.72,
                          1.0
                        ]),
                      ),
                    ],
                    //colors: <Color>[Color(0xFFCC2B5E), Color(0xFF753A88)],
                    radiusFactor: 0.50,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.1,
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget bodySection(double t, double h) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      SizedBox(height: 10),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(5),
              alignment: Alignment.center,
              width: 110,
              height: 150,
              color: Colors.lightBlueAccent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'ความชื้น',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Icon(
                      CupertinoIcons.drop_fill,
                      color: Colors.blue,
                      size: 50.0,
                    ),
                    Text(
                      ' $h %',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(5),
              alignment: Alignment.center,
              width: 110,
              height: 150,
              color: Colors.tealAccent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'อุณหภูมิ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Icon(
                      CupertinoIcons.thermometer,
                      color: Colors.blue,
                      size: 50.0,
                    ),
                    Text(
                      '$t C',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(5),
              width: 110,
              height: 150,
              color: Colors.lightGreenAccent,
              child: Center(
                child: ligh(t),
              ),
            ),
          ]),
    ],
  );
}

Widget ligh(double t) {
  if (t <= 20) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ภาพรวม',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        Icon(
          CupertinoIcons.snow,
          color: Colors.blue,
          size: 50.0,
        ),
        Text(
          ' หนาว',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ],
    );
  } else if (t < 27) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ภาพรวม',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        Icon(
          CupertinoIcons.cloud_sun,
          color: Colors.blue,
          size: 50.0,
        ),
        Text(
          ' เย็นสบาย',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ],
    );
  } else if (t <= 34) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ภาพรวม',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        Icon(
          CupertinoIcons.sun_min,
          color: Colors.blue,
          size: 50.0,
        ),
        Text(
          ' อุ่น',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ],
    );
  } else if (t > 34) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ภาพรวม',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        Icon(
          CupertinoIcons.sun_max_fill,
          color: Colors.blue,
          size: 50.0,
        ),
        Text(
          ' ร้อน',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ],
    );
  }
}

Widget setBotom(context) {
  return BottomAppBar(
    color: Colors.lightGreenAccent,
    child: Row(
      children: [
        IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => allView()));
          },
          tooltip: 'Light',
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.chevron_right, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CamPage()));
          },
          tooltip: 'Humd & Temp',
        ),
      ],
    ),
  );
}
