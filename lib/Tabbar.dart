import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'guagse.dart';
import 'electricity.dart';
import 'iotscreen.dart';

class Tapbar extends StatefulWidget {
  @override
  _TapbarState createState() => _TapbarState();
}

class _TapbarState extends State<Tapbar> {
  int selectedpage = 0; //initial value

  final _pageOptions = [
    IotScreen(),
    guagseScreen(),
    elecSceen()

  ]; // listing of all 3 pages index wise

  final bgcolor = [
    Colors.brown[50],
    Colors.brown[50],
    Colors.brown[50],
    // Colors.purple[100],
    Colors.pink[200]
  ]; // changing color as per active index value

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MultiLevelDrawer(
          backgroundColor: Colors.white,
          rippleColor: Colors.brown[200],
          subMenuBackgroundColor: Colors.brown[50],
          header: Container(
            // Header for Drawer
            // height: size.height * 0.25,
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/friends.jpg",
                      width: 206,
                      height: 180,
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Text(
                      "Tack Me Home",
                      style: GoogleFonts.mali(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.brown[800]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          ),
          children: [
            // Child Elements for Each Drawer Item
            MLMenuItem(
              // leading: Icon(Icons.person),
                leading: ImageIcon(
                  new AssetImage('assets/1pet-house.png'),
                  size: 29,
                ),
                // trailing: Icon(Icons.arrow_right),
                content: Text(
                  " Home",
                  style: GoogleFonts.mali(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Tapbar()));
                }),

            MLMenuItem(
              // leading: Icon(Icons.settings),
              leading: ImageIcon(
                AssetImage('assets/pawprint.png'),
                size: 31,
              ),
              // trailing: Icon(Icons.arrow_right),
              content: Text(
                "Pet new",
                style: GoogleFonts.mali(
                  fontWeight: FontWeight.w600,
                ),
              ),
              onClick: () {},
              // subMenuItems: [
              //   MLSubmenu(
              //       onClick: () {},
              //       submenuContent: Text(" Hamsters",
              //           style:
              //               GoogleFonts.mali(fontWeight: FontWeight.w600))),
              //   MLSubmenu(
              //       onClick: () {},
              //       submenuContent: Text(" Cats",
              //           style:
              //               GoogleFonts.mali(fontWeight: FontWeight.w600))),
              //   MLSubmenu(
              //       onClick: () {},
              //       submenuContent: Text(" Bunnies",
              //           style:
              //               GoogleFonts.mali(fontWeight: FontWeight.w600))),
              //   MLSubmenu(
              //       onClick: () {},
              //       submenuContent: Text(" Dogs",
              //           style: GoogleFonts.mali(fontWeight: FontWeight.w600)))
              // ]
            ),

            MLMenuItem(
              // leading: Icon(Icons.notifications),
              leading: ImageIcon(
                AssetImage('assets/31heart.png'),
                size: 30,
              ),
              content: Text(
                "Donate",
                style: GoogleFonts.mali(
                  fontWeight: FontWeight.w600,
                ),
              ),
              onClick: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => elecSceen()));
              },
            ),

            MLMenuItem(
              // leading: Icon(Icons.payment),
                leading: ImageIcon(
                  AssetImage('assets/menu.png'),
                  size: 31,
                ),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "Other",
                  style: GoogleFonts.mali(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subMenuItems: [
                  MLSubmenu(
                      onClick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IotScreen()));
                      },
                      submenuContent: Text(" About us",
                          style:
                          GoogleFonts.mali(fontWeight: FontWeight.w600))),
                  MLSubmenu(
                      onClick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => guagseScreen()));
                      },
                      submenuContent: Text(" Contact us",
                          style:
                          GoogleFonts.mali(fontWeight: FontWeight.w600))),
                  MLSubmenu(
                      onClick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => guagseScreen()));
                      },
                      submenuContent: Text(" Terms and Conditions",
                          style:
                          GoogleFonts.mali(fontWeight: FontWeight.w600))),
                ],
                onClick: () {}),

            MLMenuItem(
              // leading: Icon(Icons.payment),
                leading: ImageIcon(
                  AssetImage('images/logout.png'),
                  size: 28,
                ),
                // trailing: Icon(Icons.arrow_right),
                content: Text(
                  "Signout",
                  style: GoogleFonts.mali(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => guagseScreen()));
                }),
          ],
        ),

        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Take Me Home",
            style: GoogleFonts.mali(
              //กำหนดฟอนต์
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          actions: <Widget>[
            // IconButton(
            //   icon: const Icon(Icons.add_alert),
            //   tooltip: 'Show Snackbar',
            //   onPressed: () {
            //   },
            // ),

            ImageIcon(
              AssetImage('assets/animal-shelter.png'), //ไอคอนมุมขวาบน
              size: 40, //assets/pawprint.png
              color: Colors.white,
            ),
          ],
        ),

        body: _pageOptions[
        selectedpage], // initial value is 0 so HomePage will be shown

        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          buttonBackgroundColor: Colors.white,
          backgroundColor: bgcolor[selectedpage],
          color: Colors.white,
          animationCurve: Curves.linearToEaseOut,
          items: <Widget>[
            ImageIcon(
              AssetImage('assets/1pet-house.png'),

              size: 34, //assets/pawprint.png
              color: Colors.brown,
            ),
            ImageIcon(
              AssetImage('assets/pawprint.png'),
              size: 36,
              color: Colors.brown,
            ),
            ImageIcon(
              AssetImage('assets/31heart.png'),
              size: 35,
              color: Colors.brown,
            ),
            // ImageIcon(
            //   AssetImage('assets/user.png'),
            //   size: 36,
            //   color: Colors.brown,
            // ),
            ImageIcon(
              AssetImage('assets/menu.png'),
              size: 32,
              color: Colors.brown,
            ),
          ],
          index: 0,
          onTap: (index) {
            setState(() {
              selectedpage =
                  index; // changing selected page as per bar index selected by the user
            });
          },
        ),
      ),
    );
  }
}