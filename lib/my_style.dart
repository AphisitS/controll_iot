import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStyle {
  Color darkColor = Color(0xff6d4c41);
  Color primaryColor = Color(0xffffab40);
  Color lightColor = Color(0xffffffb1);

  TextStyle redBoldStyle() => TextStyle(
        color: Colors.red.shade700,
        fontWeight: FontWeight.bold,
      );

  Widget showLogo() => Image.asset('images/logo.png');

  Widget title1(String string) => Text(
        string,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      );

  Widget title2(String string) => Text(
        string,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      );

  Widget title3(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16,
          //fontWeight: FontWeight.bold
        ),
      );


  Widget title4(String string) => Text(
        string,
        style: GoogleFonts.mali(
                  fontWeight: FontWeight.w600,fontSize: 16,),
      );


  Widget title2White(String string) => Text(
        string,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500,color: Colors.white),
      );

  MyStyle();
}
