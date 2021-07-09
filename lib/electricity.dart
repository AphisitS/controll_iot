import 'dart:async';
import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'allView.dart';
import 'iotscreen.dart';
import 'guagse.dart';
import 'cam.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'plant.dart';

class elecSceen extends StatefulWidget {
  final String title;

  elecSceen({Key key, this.title}) : super(key: key);

  @override
  _elecPage createState() => _elecPage();
}

class _elecPage extends State<elecSceen> {
  allViewState aV = new allViewState();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool value = true;
  final dbRef = FirebaseDatabase.instance.reference();
  int _counter = 0;
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;
  int _counter4 = 0;
  Timer _timer;
  double n1 = 0,
      n2 = 0.1,
      n3 = 0.1,
      n4 = 0.1,
      n5 = 0.1,
      n6 = 0.1,
      n7 = 0.1,
      n8 = 0.1,
      n9 = 0.1,
      n10 = 0.1,
      n11 = 0.1,
      n12 = 0.1,
      n13 = 0.1,
      n14 = 0.1,
      n15 = 0;

  double e1 = 0,
      e2 = 0.1,
      e3 =0,
      e4=0,
      e5=0,
      e6=0,
      e7=0,
      e8=0,
      e9=0,
      e10=0,
      e11=0,
      e12=0,
      e13=0,
      e14=0,
      e15=0;

  double v1 = 0,
      v2 = 0.1,
      v3 = 0.1,
      v4 = 0.1,
      v5 = 0.1,
      v6 = 0.1,
      v7 = 0.1,
      v8 = 0.1,
      v9 = 0.1,
      v10 = 0.1,
      v11 = 0.1,
      v12 = 0.1,
      v13 = 0.1,
      v14 = 0.1,
      v15 = 0.1;

  double f1 = 0,
      f2 = 0.1,
      f3 = 0.1,
      f4 = 0.1,
      f5 = 0.1,
      f6 = 0.1,
      f7 = 0.1,
      f8 = 0.1,
      f9 = 0.1,
      f10 = 0.1,
      f11 = 0.1,
      f12 = 0.1,
      f13 = 0.1,
      f14 = 0.1,
      f15 = 0.1;

  double c1 = 0,
      c2 = 0.1,
      c3 = 0.1,
      c4 = 0.1,
      c5 = 0.1,
      c6 = 0.1,
      c7 = 0.1,
      c8 = 0.1,
      c9 = 0.1,
      c10 = 0.1,
      c11 = 0.1,
      c12 = 0.1,
      c13 = 0.1,
      c14 = 0.1,
      c15 = 0.1;

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  startTimer() {
    //_counter = 0;
    n15 = allViewState.eP;
    e15 = allViewState.eE;
    v15 = allViewState.eV;
    f15 = allViewState.eF;
    c15 = allViewState.eC;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter1 >= 0) {
          _counter1++;

          /* n20=n19;
          n19=n18;
          n18=n17;
          n17=n16;
          n16=n15;*/

          n1 = allViewState.eP;
          n2=n1;
          n3=n2;
          n4=n3;
          n5=n4;
          n6=n5;
          n7=n6;
          n8=n7;
          n9=n8;
          n10=n9;
          n11=n10;
          n12=n11;
          n13=n12;
          n14=n13;
          n15=n14;
        } else {
          _timer.cancel();
        }
        if (_counter >= 0) {
          _counter++;

          /* n20=n19;
          n19=n18;
          n18=n17;
          n17=n16;
          n16=n15;*/
          e15 = e14;
          e14 = e13;
          e13 = e12;
          e12 = e11;
          e11 = e10;
          e10 = e9;
          e9 = e8;
          e8 = e7;
          e7 = e6;
          e6 = e5;
          e5 = e4;
          e4 = e3;
          e3 = e2;
          e2 = e1;
          e1 = allViewState.eE;


        } else {
          _timer.cancel();
        }
        if (_counter2 >= 0) {
          _counter2++;

          /* n20=n19;
          n19=n18;
          n18=n17;
          n17=n16;
          n16=n15;*/
          v15 = v14;
          v14 = v13;
          v13 = v12;
          v12 = v11;
          v11 = v10;
          v10 = v9;
          v9 = v8;
          v8 = v7;
          v7 = v6;
          v6 = v5;
          v5 = v4;
          v4 = v3;
          v3 = v2;
          v2 = v1;
          v1 = allViewState.eV;


        } else {
          _timer.cancel();
        }
        if (_counter3 >= 0) {
          _counter3++;

          /* n20=n19;
          n19=n18;
          n18=n17;
          n17=n16;
          n16=n15;*/
          f15 = f14;
          f14 = f13;
          f13 = f12;
          f12 = f11;
          f11 = f10;
          f10 = f9;
          f9 = f8;
          f8 = f7;
          f7 = f6;
          f6 = f5;
          f5 = f4;
          f4 = f3;
          f3 = f2;
          f2 = f1;
          f1 = allViewState.eF;
        } else {
          _timer.cancel();
        }
        if (_counter4 >= 0) {
          _counter4++;

          /* n20=n19;
          n19=n18;
          n18=n17;
          n17=n16;
          n16=n15;*/
          c15 = c14;
          c14 = c13;
          c13 = c12;
          c12 = c11;
          c11 = c10;
          c10 = c9;
          c9 = c8;
          c8 = c7;
          c7 = c6;
          c6 = c5;
          c5 = c4;
          c4 = c3;
          c3 = c2;
          c2 = c1;
          c1 = allViewState.eC;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
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
                  'Electric',
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'Voltage',
              ),
              Tab(
                text: 'Power',
              ),
              Tab(
                text: 'Energy',
              ),
              Tab(
                text: 'Freequency',
              ),
              Tab(
                text: 'Current',
              ),
              Tab(
                text: 'Cut of Power',
              ),
            ],
          ), //title: Text(widget.title),
        ),
        drawer: aV.setDrawer(context),
        bottomNavigationBar: setBotom(context),
        floatingActionButton: aV.setFBotom(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jfif'),
              fit: BoxFit.cover,
            ),
          ),
          child: TabBarView(
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
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
                      colors: [Colors.lightGreenAccent, Colors.orangeAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    (n1 <= 0)
                        ? startTimer()
                        : SfCartesianChart(
                            // Chart title text
                            title: ChartTitle(text: 'Voltage'),
                            // Initialize category axis
                            primaryXAxis: CategoryAxis(
                              title: AxisTitle(
                                text: ' $v1 V ',
                                textStyle: ChartTextStyle(
                                    color: Colors.deepOrange,
                                    fontFamily: 'Roboto',
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            primaryYAxis: NumericAxis(
                                minimum: 0, maximum: 300, title: AxisTitle()),
                            series: <ChartSeries>[
                                // Initialize line series

                                LineSeries<SalesData, String>(
                                    dataSource: [
                                      // Bind data source
                                      SalesData('1', v15),
                                      SalesData('2', v14),
                                      SalesData('3', v13),
                                      SalesData('4', v12),
                                      SalesData('5', v11),
                                      SalesData('6', v10),
                                      SalesData('7', v9),
                                      SalesData('8', v8),
                                      SalesData('9', v7),
                                      SalesData('10', v6),
                                      SalesData('11', v5),
                                      SalesData('12', v4),
                                      SalesData('13', v3),
                                      SalesData('14', v2),
                                      SalesData('15', v1),
                                    ],
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales)
                              ]),
                  ],
                ),
              ),
              Container(
                // margin: const EdgeInsets.all(20),
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
                      colors: [Colors.red, Colors.purpleAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SfCartesianChart(

                        // Chart title text
                        title: ChartTitle(text: 'Power'),
                        // Initialize category axis
                        primaryXAxis: CategoryAxis(
                          title: AxisTitle(
                            text: ' $n1 W',
                            textStyle: ChartTextStyle(
                                color: Colors.deepOrange,
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        primaryYAxis: NumericAxis(title: AxisTitle()),
                        series: <ChartSeries>[
                          // Initialize line series
                          LineSeries<SalesData, String>(
                              dataSource: [
                                // Bind data source

                                SalesData('1', n15),
                                /* SalesData('1', n19),
                              SalesData('2', n18),
                              SalesData('3', n17),
                              SalesData('4', n16),
                              SalesData('5', n15),*/
                                SalesData('2', n14),
                                SalesData('3', n13),
                                SalesData('4', n12),
                                SalesData('5', n11),
                                SalesData('6', n10),
                                SalesData('7', n9),
                                SalesData('8', n8),
                                SalesData('9', n7),
                                SalesData('10', n6),
                                SalesData('11', n5),
                                SalesData('12', n4),
                                SalesData('13', n3),
                                SalesData('14', n2),
                                SalesData('15', n1),
                                // SalesData('     ', _counter),
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales)
                        ]),
                  ],
                ),
              ),
              Container(
                // margin: const EdgeInsets.all(20),
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
                      colors: [Colors.purpleAccent, Colors.lightBlueAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SfCartesianChart(
                        // Chart title text
                        title: ChartTitle(text: 'Energy'),
                        // Initialize category axis
                        primaryXAxis: CategoryAxis(
                          title: AxisTitle(
                            text: ' $e1 kWh ',
                            textStyle: ChartTextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        primaryYAxis: NumericAxis(
                            minimum: 0, maximum: 1.0, title: AxisTitle()),
                        series: <ChartSeries>[
                          // Initialize line series
                          LineSeries<SalesData, String>(
                              dataSource: [
                                // Bind data source
                                SalesData('1', e15),
                                SalesData('2', e14),
                                SalesData('3', e13),
                                SalesData('4', e12),
                                SalesData('5', e11),
                                SalesData('6', e10),
                                SalesData('7', e9),
                                SalesData('8', e8),
                                SalesData('9', e7),
                                SalesData('10', e6),
                                SalesData('11', e5),
                                SalesData('12', e4),
                                SalesData('13', e3),
                                SalesData('14', e2),
                                SalesData('15', e1),
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales)
                        ]),
                  ],
                ),
              ),
              Container(
                //margin: const EdgeInsets.all(20),
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
                      colors: [Colors.orange, Colors.yellowAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SfCartesianChart(
                        // Chart title text
                        title: ChartTitle(text: 'Freequenzy'),
                        // Initialize category axis
                        primaryXAxis: CategoryAxis(
                          title: AxisTitle(
                            text: ' $f1 Hz ',
                            textStyle: ChartTextStyle(
                                color: Colors.deepOrange,
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        primaryYAxis: NumericAxis(
                            minimum: 0, maximum: 100, title: AxisTitle()),
                        series: <ChartSeries>[
                          // Initialize line series
                          LineSeries<SalesData, String>(
                              dataSource: [
                                // Bind data source
                                SalesData('1', f15),
                                SalesData('2', f14),
                                SalesData('3', f13),
                                SalesData('4', f12),
                                SalesData('5', f11),
                                SalesData('6', f10),
                                SalesData('7', f9),
                                SalesData('8', f8),
                                SalesData('9', f7),
                                SalesData('10', f6),
                                SalesData('11', f5),
                                SalesData('12', f4),
                                SalesData('13', f3),
                                SalesData('14', f2),
                                SalesData('15', f1),
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales)
                        ]),
                  ],
                ),
              ),
              Container(
                //  margin: const EdgeInsets.all(20),
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
                      colors: [Colors.limeAccent, Colors.tealAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SfCartesianChart(
                        // Chart title text
                        title: ChartTitle(text: 'Current'),
                        // Initialize category axis
                        primaryXAxis: CategoryAxis(
                          title: AxisTitle(
                            text: ' $c1 A ',
                            textStyle: ChartTextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        primaryYAxis: NumericAxis(
                            minimum: 0, maximum: 2, title: AxisTitle()),
                        series: <ChartSeries>[
                          // Initialize line series
                          LineSeries<SalesData, String>(
                              dataSource: [
                                // Bind data source
                                SalesData('1', c15),
                                SalesData('2', c14),
                                SalesData('3', c13),
                                SalesData('4', c12),
                                SalesData('5', c11),
                                SalesData('6', c10),
                                SalesData('7', c9),
                                SalesData('8', c8),
                                SalesData('9', c7),
                                SalesData('10', c6),
                                SalesData('11', c5),
                                SalesData('12', c4),
                                SalesData('13', c3),
                                SalesData('14', c2),
                                SalesData('15', c1),
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales)
                        ]),
                  ],
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
                        colors: [Colors.pinkAccent, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: FlatButton(
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(20.0),
                        padding: const EdgeInsets.all(10.0),
                        width: 250,
                        height: 100,
                        child: bot(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueAccent,
                              offset: const Offset(
                                3.0,
                                3.0,
                              ), //Offset
                              blurRadius: 15.0,
                              spreadRadius: 2.0,
                            ),
                            BoxShadow(
                              color: Colors.deepPurple,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow//BoxShadow
                          ],
                          // color: Colors.purple,
                        ),
                      ),
                      onPressed: () {
                        if (value == true) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _buildPopupDialog(context),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _buildPopupDialog2(context),
                          );
                        }
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget bot() {
    if (value == true) {
      return Text(
        'ต้องการปิดกระเเสไฟ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontStyle: FontStyle.normal,
        ),
      );
    } else {
      return Text(
        'ต้องการเปิดกระเเสไฟ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontStyle: FontStyle.normal,
        ),
      );
    }
  }

  Future<void> writeData() async {
    dbRef.child("CutPower").set({"value": value});
  }

  Widget _buildPopupDialog(BuildContext context) {
    String inid;

    return new AlertDialog(
      backgroundColor: Colors.lightBlueAccent,
      title: const Text(
        'กรุณาใส่รหัสเพื่อยืนยัน',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '4688',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          TextField(
            style: TextStyle(
              color: Colors.grey,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'กรุณาใส่รหัสด้านบน',
              contentPadding: new EdgeInsets.all(10.0),
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            onChanged: (String string) {
              inid = string.trim();
            },
          )
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            if (inid == '4688') {
              onUpdate();
              writeData();
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog3(context),
              );
            } else {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog4(context),
              );
            }
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('ยืนยัน'),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('ยกเลิก'),
        ),
      ],
    );
  }

  Widget _buildPopupDialog2(BuildContext context) {
    return new AlertDialog(
      backgroundColor: Colors.lightBlueAccent,
      title: const Text(
        'แจ้งเตือน',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'คุณต้องการเปิดไฟหรือไม่',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            onUpdate();
            writeData();

            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog5(context),
            );
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('ยืนยัน'),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('ยกเลิก'),
        ),
      ],
    );
  }

  Widget _buildPopupDialog3(BuildContext context) {
    return new AlertDialog(
      backgroundColor: Colors.lightBlueAccent,
      title: const Text(
        'ตัดไฟสำเร็จ',
        style: TextStyle(fontSize: 25, color: Colors.black),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('OK'),
        ),
      ],
    );
  }

  Widget _buildPopupDialog4(BuildContext context) {
    return new AlertDialog(
      backgroundColor: Colors.lightBlueAccent,
      title: const Text(
        'ข้อผิดพลาด',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'ใส่รหัสผิด กรุณาใส่ใหม่อีกครั้ง',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('ยืนยัน'),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('ยกเลิก'),
        ),
      ],
    );
  }

  Widget _buildPopupDialog5(BuildContext context) {
    return new AlertDialog(
      backgroundColor: Colors.lightBlueAccent,
      title: const Text(
        'แจ้งเตือน',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'เปิดกระเเสไฟ สำเร็จ',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('OK'),
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
          icon:
              Icon(CupertinoIcons.left_chevron, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CamPage()));
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
                builder: (BuildContext context) => plantSceen()));
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
  final double sales;
}
