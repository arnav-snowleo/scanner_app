import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_me/pages/aboutusScreen.dart';
import 'package:scan_me/pages/contactusScreen.dart';
import 'package:scan_me/pages/privacyScreen.dart';
import 'file:///C:/Users/CHINU/Desktop/new-master/lib/camera/mainScreen.dart';
import 'package:scan_me/pages/themeScreen.dart';
import 'package:scan_me/pages/documentScreen.dart';
import 'package:scan_me/pages/settingsScreen.dart';
import 'package:scan_me/pages/shareappScreen.dart';
import 'package:scan_me/pages/helpScreen.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 23,
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                ),
                child: Text(
                    'XYZ Enterprises\n \n All rights reserved to XYZ Enterprises'),
                /*decoration: BoxDecoration(
                      image:  DecorationImage(
                          image: AssetImage("assets/images/ultrabot.png"),
                          fit: BoxFit.cover),
                    ),*/
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView(children: [
              ListTile(
                leading: Icon(Icons.library_books),
                title: Text("Documents"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DocumentScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Help"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HelpScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                  leading: Icon(Icons.report_problem),
                  title: Text("Privacy Policy"),
                  onTap: () {
                    //Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PrivacyScreen(),
                      ),
                    );
                  }),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.mobile_screen_share),
                title: Text("Share this App"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ShareAppScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.sentiment_very_satisfied),
                title: Text("About Us"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AboutUsScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text("Contact Us"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContactUsScreen(),
                    ),
                  );
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
