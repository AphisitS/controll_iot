import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

import 'package:controll_app/electricity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'allView.dart';
import 'iotscreen.dart';
import 'guagse.dart';
import 'package:webview_flutter/webview_flutter.dart';

const _url = 'http://192.168.43.144';

class CamPage extends StatefulWidget {
  final String title;

  CamPage({Key key, this.title}) : super(key: key);

  @override
  _CamPage createState() => _CamPage();
}

class _CamPage extends State<CamPage> {
  allViewState aV = new allViewState();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: aV.setAppbar('Security Camera'),
        drawer: aV.setDrawer(context),
        bottomNavigationBar: setBotom(context),
        floatingActionButton: aV.setFBotom(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Center(
          child: Container(
            height: 100,
            width: 300,
            child: RaisedButton(
              color: Colors.deepPurple,
              onPressed: _launchURL,
              child: Container(

                child: Text(
                  'ดูกล้องวงจรปิด',
                  style: TextStyle(
                      fontSize: 35,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
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
          icon:
              Icon(CupertinoIcons.left_chevron, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => guagseScreen()));
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
                builder: (BuildContext context) => elecSceen()));
          },
          tooltip: 'Humd & Temp',
        ),
      ],
    ),
  );
}

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
