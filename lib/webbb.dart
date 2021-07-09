import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'http://192.168.43.144';

void main() => runApp(
  const MaterialApp(
    home: Material(
      child: Center(
        child: RaisedButton(
          onPressed: _launchURL,
          child: Text('Show Flutter homepage'),
        ),
      ),
    ),
  ),
);

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';