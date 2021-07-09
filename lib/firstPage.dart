import 'package:controll_app/cam.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_widget.dart';
import 'allView.dart';
import 'webbb.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeSceen()));

class HomeSceen extends StatefulWidget {
  HomeSceen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Image.asset(
              'img/bg4.jpg',
              fit: BoxFit.contain,
              height: 45,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('ทีมงานgodยานยนตร์'))*/
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: <Widget>[
                HeadSection,
                buttonSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget HeadSection = Container(
  child: SafeArea(
    child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(10.0),
          width: 320,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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
            image: DecorationImage(
              image: AssetImage('assets/images/bg4.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget buttonSection(context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: [
            Container(
              child: TextButton(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(10.0),
                  width: 150,
                  height: 50,
                  child: Text(
                    'เข้าสู่แอพ',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(
                          3.0,
                          3.0,
                        ), //Offset
                        blurRadius: 15.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow//BoxShadow
                    ],
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>allView()),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
