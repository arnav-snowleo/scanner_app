import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:scan_me/camera/camerass.dart';
import 'package:scan_me/camera/filterScreen.dart';
import 'package:scan_me/camera/mainScreen.dart';

import 'documentscreen.dart';

class Homepage extends StatefulWidget {
  static const String id = "Homepage";
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _page = 0;
  final List<Widget> _children = [
    MainScreen(),
    CameraMain(),
    Docscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_page],
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(
            Icons.pages,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.camera_alt,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.description,
            size: 30,
            color: Colors.white,
          ),
        ],
        color: Colors.indigo,
        buttonBackgroundColor: Colors.indigo,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        height: 55,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
