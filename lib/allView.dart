import 'package:controll_app/draw.dart';
import 'package:controll_app/electricity.dart';
import 'package:controll_app/guagse.dart';
import 'package:controll_app/plant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'guagse.dart';
import 'iotscreen.dart';
import 'cam.dart';
import 'electricity.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: allView()));
double fontS = 15;

class allView extends StatefulWidget {
  allView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  allViewState createState() => allViewState();

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class allViewState extends State<allView> {
  final dbRef = FirebaseDatabase.instance.reference();
  final dbRef1 = FirebaseDatabase.instance.reference();
  final dbRef2 = FirebaseDatabase.instance.reference();
  final dbRef3 = FirebaseDatabase.instance.reference();

  static double t, h, eV, eC, eP, eE, eF, soil;
  bool switch1 = IotScreenState.value1,
      switch2 = IotScreenState.value2,
      switch3 = IotScreenState.value3,
      Switch = IotScreenState.value;

  //double tem;
  //double hum = 87uiyjhallView.h;

  Widget th(double t, double h) {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.red,
            labelStyle: TextStyle(fontSize: 15),
            tabs: [
              Tab(
                text: 'สภาพแวดล้อม',
              ),
              Tab(
                text: 'การใช้ไฟฟ้า',
              ),
              Tab(
                text: 'การเปิด/ปิดไฟ',
              ),
            ],
          ),
          iconTheme: IconThemeData(color: Colors.black, size: 30),
          backgroundColor: Colors.lightGreenAccent,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/bg4.jpg',
                    fit: BoxFit.contain, height: 60),
                Spacer(),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ), //title: Text(widget.title),
        ),
        drawer: setDrawer(context),
        bottomNavigationBar: setBotom(context),
        floatingActionButton: setFBotom(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: Container(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.jfif'),
                  fit: BoxFit.cover,
                ),
              ),
              child: StreamBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        !snapshot.hasError &&
                        snapshot.data.snapshot.value != null) {
                      t = snapshot.data.snapshot.value["Temperature:"];
                      h = snapshot.data.snapshot.value["Humidity:"];
                      eC = snapshot.data.snapshot.value["Current:"];
                      eE = snapshot.data.snapshot.value["Energy:"];
                      eF = snapshot.data.snapshot.value["Frequency:"];
                      eP = snapshot.data.snapshot.value["Power:"];
                      eV = snapshot.data.snapshot.value["Voltage:"];
                      /*Switch = snapshot.data.snapshot.value["switch"];
                      switch1 = snapshot.data.snapshot.value["switch1"];
                      switch2 = snapshot.data.snapshot.value["switch2"];
                      switch3 = snapshot.data.snapshot.value["switch3"];*/

                      eF -= 0.001;
                      soil = snapshot.data.snapshot.value["Moisture:"];
                      h -= 0.001;
                      t -= 0.001;
                      soil -= 0.01;
                      return Container(
                        child: SafeArea(
                          child: Container(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/bg.jfif'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: TabBarView(
                                children: <Widget>[
                                  FirstSection(t, h),
                                  lineSection(eV, eC, eP, eE, eF),
                                  RoomSection(
                                      Switch, switch1, switch2, switch3),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {}
                    return Container();
                  },
                  stream: dbRef.child("Data").onValue),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> writeData() async {
    dbRef.child("Data").set({"switch": Switch});
  }

  Future<void> writeData1() async {
    dbRef1.child("Data").set({"switch1": switch1});
  }

  Future<void> writeData2() async {
    dbRef2.child("Data").set({"switch2": switch2});
  }

  Future<void> writeData3() async {
    dbRef3.child("Data").set({"switch3": switch3});
  }

  Widget setDrawer(context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 200,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/bg4.jpg',
                        fit: BoxFit.contain, height: 100),
                    Text(
                      'MyHome',
                      style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.purpleAccent,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => allView()));
              },
            ),
            ListTile(
              leading: Icon(Icons.ac_unit_outlined, color: Colors.blue),
              title: Text(
                'Humd & Temp',
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => guagseScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.lightbulb, color: Colors.red),
              title: Text(
                'Light',
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => IotScreen()));
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.camera_alt_rounded, color: Colors.orangeAccent),
              title: Text(
                'SecurityCamera',
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CamPage()));
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.electrical_services, color: Colors.yellowAccent),
              title: Text(
                'Electic',
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => elecSceen()));
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.tree, color: Colors.lightGreen),
              title: Text(
                'Plant',
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => plantSceen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget setAppbar(Name) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black, size: 30),
      backgroundColor: Colors.lightGreenAccent,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/bg4.jpg',
                fit: BoxFit.contain, height: 60),
            Spacer(),
            Text(
              '$Name',
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ), //title: Text(widget.title),
    );
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
                  builder: (BuildContext context) => IotScreen()));
            },
            tooltip: 'Light',
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.chevron_right,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => guagseScreen()));
            },
            tooltip: 'Humd & Temp',
          ),
        ],
      ),
    );
  }

  Widget setFBotom(context) {
    return FloatingActionButton(
      child: Icon(Icons.home),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => allView()));
      },
      tooltip: 'Home',
    );
  }
}

Widget FirstSection(t, h) {
  List<ChartData> chartData = [
    ChartData('Temperture ', t, Colors.teal),
    ChartData('Humdity ', h, Colors.orange),
  ];

  return Container(
    margin: const EdgeInsets.all(10.0),
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: [
            Container(
              width: 300,
              height: 500,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(
                      3.0,
                      3.0,
                    ), //Offset
                    blurRadius: 7.5,
                    spreadRadius: 1,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white70,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
                //color: Colors.purple,
                gradient: new LinearGradient(
                    colors: [Colors.pinkAccent, Colors.lightGreenAccent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
              child: SfCartesianChart(
                plotAreaBorderColor: Colors.red,
                borderWidth: 2,
                primaryXAxis: CategoryAxis(

                  title: AxisTitle(
                      text: '',
                      textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                primaryYAxis:
                    NumericAxis(minimum: 0, maximum: 100, title: AxisTitle()),
                series: <CartesianSeries>[
                  ColumnSeries<ChartData, String>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    pointColorMapper: (ChartData data, _) => data.color,
                    borderWidth: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget lineSection(eV, eC, eP, eE, eF) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(10.0),
              width: 300,
              height: 500,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(
                      3.0,
                      3.0,
                    ), //Offset
                    blurRadius: 7.5,
                    spreadRadius: 1,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white70,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
                //color: Colors.purple,
                gradient: new LinearGradient(
                    colors: [Colors.black, Colors.red],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft),
              ),
              child: GridView.count(

                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                padding: EdgeInsets.all(20),
                childAspectRatio: 3 / 2,
                children: [
                  Text('Voltage'),
                  Text('$eV'),
                  Text('Current'),
                  Text('$eC'),
                  Text('Power'),
                  Text('$eP'),
                  Text('Energy'),
                  Text('$eE'),
                  Text('Freequenzy'),
                  Text('$eF'),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget RoomSection(bool Switch, bool switch1, bool switch2, bool switch3) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(10.0),
              width: 300,
              height: 500,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(
                      3.0,
                      3.0,
                    ), //Offset
                    blurRadius: 7.5,
                    spreadRadius: 1,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white70,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
                //color: Colors.purple,
                gradient: new LinearGradient(
                    colors: [Colors.cyanAccent, Colors.purpleAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('ห้องพ่อ', style: TextStyle(fontSize: fontS)),
                      Text('ห้องน้อง', style: TextStyle(fontSize: fontS)),
                      Text('ห้องโถง', style: TextStyle(fontSize: fontS)),
                      Text('ห้องฉัน', style: TextStyle(fontSize: fontS)),
                      //Text('Setting', style: TextStyle(fontSize: fontS)),
                    ],
                  ),
                  VerticalDivider(color: Colors.black, thickness: 2.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: mySwitch(Switch),
                      ),
                      Container(
                        child: mySwitch(switch1),
                      ),
                      Container(
                        child: mySwitch(switch2),
                      ),
                      Container(
                        child: mySwitch(switch3),
                      ),
                      /* Container(
                        child: IconButton(icon: Icon(Icons.settings),)
                      ),*/
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  String x;
  double y;
  Color color;
}

class SalesData {
  SalesData(this.sales);

  //final String year;
  final double sales;
}

Widget mySwitch(Switch) {
  if (Switch == true) {
    return Icon(Icons.lightbulb, color: Colors.green);
  } else {
    return Icon(Icons.lightbulb, color: Colors.red);
  }
}
