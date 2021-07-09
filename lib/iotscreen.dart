import 'dart:async';
import 'package:controll_app/allView.dart';
import 'package:controll_app/plant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'guagse.dart';

class IotScreen extends StatefulWidget {
  @override
  IotScreenState createState() => IotScreenState();
}

class IotScreenState extends State<IotScreen>
    with SingleTickerProviderStateMixin {
  @override
  final dbRef = FirebaseDatabase.instance.reference();
  final dbRef1 = FirebaseDatabase.instance.reference();
  final dbRef3 = FirebaseDatabase.instance.reference();
  final dbRef2 = FirebaseDatabase.instance.reference();

  static bool value = false, value1= false, value2= false, value3= false;


  Color color = Colors.grey;

  onUpdate() {
    setState(() {
      value = !value;

    });
  }

  onUpdate1() {
    setState(() {
      value1 = !value1;

    });
  }

  onUpdate2() {
    setState(() {
      value2 = !value2;

    });
  }

  onUpdate3() {
    setState(() {
      value3 = !value3;

    });
  }


  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  allViewState aV = new allViewState();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: aV.setAppbar('Light'),
        drawer: aV.setDrawer(context),
        bottomNavigationBar: setBotom(context),
        floatingActionButton: aV.setFBotom(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        key: _scaffoldKey,
        body: SafeArea(

          child: StreamBuilder(

            builder: (context, snapshot) {
              dbRef.child("LightState").set({"switch": value});
              dbRef.child("LightState1").set({"switch1": value1});
              dbRef.child("LightState2").set({"switch2": value2});
              dbRef.child("LightState3").set({"switch3": value3});
              dbRef.child("LightState3.com").set({"switch3": value3});

             return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg.jfif'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: GridView.count(
                  padding: EdgeInsets.all(10),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    RoomSection('ห้องพ่อ', 0, context, value,1),
                    RoomSection('ห้องน้อง', 1, context, value1,2),
                    RoomSection('ห้องโถง', 2, context, value2,3),
                    RoomSection('ห้องฉัน', 3, context, value3,4),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> writeData() async {
    dbRef.child("LightState").set({"switch": value});
  }

  Future<void> writeData1() async {
    dbRef1.child("LightState").set({"switch1": value1});
  }

  Future<void> writeData2() async {
    dbRef2.child("LightState2").set({"switch2": value2});
  }

  Future<void> writeData3() async {
    dbRef3.child("LightState3").set({"switch3": value3});
  }

  Widget RoomSection(
    Name,
    count,
    context,
    value,
    HeroTag,
  ) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 150,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(
                          3.0,
                          3.0,
                        ), //Offset
                        blurRadius: 15.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,

                  children: [
                    Text(
                      '$Name',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new FloatingActionButton.extended(

                          heroTag: HeroTag,
                          icon: value
                              ? Icon(CupertinoIcons.lightbulb)
                              : Icon(CupertinoIcons.lightbulb_slash_fill),
                          backgroundColor: value
                              ? Colors.lightGreenAccent
                              : Colors.redAccent,
                          label: value ? Text("ON") : Text("OFF"),
                          elevation: 20.00,
                          onPressed: () {
                            if (count == 0) {
                              onUpdate();
                              writeData();
                            } else if (count == 1) {
                              onUpdate1();
                              writeData1();
                            } else if (count == 2) {
                              onUpdate2();
                              writeData2();
                            } else if (count == 3) {
                              onUpdate3();
                              writeData3();
                            }
                          },
                        ),
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
}

Widget setBotom(context) {
  return BottomAppBar(
    color: Colors.lightGreenAccent,
    child: Row(
      children: [
        IconButton(
          icon: Icon(Icons.chevron_left,color: Colors.black,size: 30),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => plantSceen()));
          },
          tooltip: 'Light',
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.chevron_right,color: Colors.black,size: 30),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => allView()));
          },
          tooltip: 'Humd & Temp',
        ),
      ],
    ),
  );
}