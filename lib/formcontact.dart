import 'package:flutter/material.dart';
import 'Showform.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static String name, address, phonenumber;
  final dbRef = FirebaseDatabase.instance.reference();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(

      child: StreamBuilder(
        builder: (context, snapshot) {
          dbRef.child("CutPower").set({"Name": name});


          return
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    child: Image(
                      image: AssetImage("images/lovepet.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                              child: TextFormField(
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.grey,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,

                                  prefixIcon: Icon(Icons.person),

                                  hintText: ('ชื่อ - นามสกุล'),
                                  contentPadding: new EdgeInsets.all(10.0),
                                ),
                                keyboardType: TextInputType.text,
                                autocorrect: false,
                                onChanged: (String string) {
                                  name = string.trim();
                                },
                              )
                          ),
                          Container(
                           child: TextFormField(
                            style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey,
                            ),
                             decoration: InputDecoration(
                              border: InputBorder.none,

                             prefixIcon: Icon(Icons.home),

                              hintText: ('ที่อยู่'),
                              contentPadding: new EdgeInsets.all(10.0),
                            ),
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                            onChanged: (String string) {
                              address = string.trim();
                              },
                            )
                          ),
                          Container(
                                  child: TextFormField(
                              style: TextStyle(
                              fontSize: 25,
                              color: Colors.grey,
                              ),
                              decoration: InputDecoration(
                              border: InputBorder.none,

                                     prefixIcon: Icon(Icons.phone),

                              hintText: ('เบอร์โทร'),
                              contentPadding: new EdgeInsets.all(10.0),
                              ),
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                              onChanged: (String string) {
                                phonenumber = string.trim();
                              },
                              )
                          ),
                          SizedBox(height: 20),
                          RaisedButton(
                            padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                            onPressed: () {
                              print(name);
                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                    builder: (context) => ShowForm()),
                              );
                            },
                            child: Text('ยืนยัน',
                                style: GoogleFonts.mali(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            color: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
        }
        ))
    );
  }
  Future<void> writeData() async {
    dbRef.child("CutPower").set({"value": name});
  }
}
