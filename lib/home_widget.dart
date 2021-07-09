import 'package:flutter/material.dart';
import 'guagse.dart';
import 'iotscreen.dart';
import 'tf.dart';
import 'package:flutter/cupertino.dart';
import 'allView.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 2;
  final List<Widget> _children = [
    guagseScreen(),
    IotScreen(),
    allView(),
    tf(),
    tf()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/bg4.jpg',
                  fit: BoxFit.contain,
                  height: 60,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('My Home'),
                ),
              ],
            ),
          ],
        ),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.thermometer,
            ),
            title: Text('Temperature'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            title: Text('Ligt'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Home')),
          new BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.tree), title: Text('Plant')),
          new BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_rounded), title: Text('Camera'))
        ],
      ),
    );
  }
}
