import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:scan_me/camera/filterScreen.dart';
import 'package:scan_me/pages/introScreen.dart';

import 'camera/camerass.dart';
import 'camera/Edit.dart';
import 'camera/get_PDF_code.dart';
import 'camera/homepage.dart';
import 'camera/mainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeData(
          primarySwatch: Colors.indigo,
          brightness: brightness,
        ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Scanner app',
            theme: theme,
            initialRoute:  Homepage.id,
            routes: {
              Homepage.id:(context)=>  Homepage(),
              CameraMain.id: (context) =>CameraMain(),
              FilterScreen.id: (context)=>FilterScreen(),
              Edit.id: (context)=>Edit(),
            },
          );
        });
  }
}
