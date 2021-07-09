import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'draw.dart';
import 'package:flutter/services.dart';

class IotScreen2 extends StatefulWidget {
  @override
  _IotScreenState createState() => _IotScreenState();
}

class _IotScreenState extends State<IotScreen2> {
  @override
  int h;
  double t;
  bool value = false;
  final dbRef = FirebaseDatabase.instance.reference();

  onUpdate() {
    setState(() {
      value = !value;
    });
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: StreamBuilder(
          stream: dbRef.child("Data").onValue,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                !snapshot.hasError &&
                snapshot.data.snapshot.value != null) {
              h = snapshot.data.snapshot.value["Humidity:"];
              t = snapshot.data.snapshot.value["Temperature:"];

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.clear_all,
                          color: Colors.black,
                        ),
                        Text(
                          "My Room",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.settings)
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Temperature",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            t.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ]),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Humidity",
                          style: TextStyle(
                              color: value ? Colors.green : Colors.redAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          t.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      onUpdate();
                      writeData();
                    },
                    label: value ? Text("ON") : Text("OFF"),
                    elevation: 20,
                    backgroundColor: value ? Colors.yellow : Colors.white,
                    icon: value
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  )
                ],
              );
            } else
              return Container();
          }),
    );
  }

  Future<void> writeData() {
    //dbRef.child("Data").set({"Humidity:" : 0, "Temperature:" :0});
    dbRef.child("LightState").set({"switch": !value});
  }
}
