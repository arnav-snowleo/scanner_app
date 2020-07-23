import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'file:///C:/Users/CHINU/Desktop/new-master/lib/camera/mainScreen.dart';
import 'package:scan_me/camera/homepage.dart';
import 'package:scan_me/camera/mainScreen.dart';

//package : smooth_page_indicator: ^0.1.5

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final controller = PageController(viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: PageView(
            controller: controller,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0xFF21A8D0), const Color(0xFF90ADBD)],
                    /*FF9CDE*/
                    begin: FractionalOffset.topRight,
                    end: FractionalOffset.bottomLeft,
                    stops: [
                      0.0,
                      1.0
                    ], // the array of  values inside stops basically say how the colors merge with each other
                    tileMode: TileMode
                        .clamp, //How this gradient should tile the plane beyond in the region before begin and after end.
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 124,
                    ),
                    Container(
                      child: Icon(
                        Icons.scanner,
                        size: 135,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 72,
                    ),
                    Container(
                      child: Text(
                        'SCAN DOCUMENTS',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        child: Text(
                          ' Now easily Scan documents using \n phone camera . Turn your mobile \n into a portable scanner !!',
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 156,
                    ),
                    Container(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0xFF7528E0), const Color(0xFF90ADBD)],
                    /*FF9CDE*/
                    begin: FractionalOffset.topRight,
                    end: FractionalOffset.bottomLeft,
                    stops: [
                      0.0,
                      1.0
                    ], // the array of  values inside stops basically say how the colors merge with each other
                    tileMode: TileMode
                        .clamp, //How this gradient should tile the plane beyond in the region before begin and after end.
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 34,
                    ),
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        'assets/images/undraw_my_documents_ym8x (1).png',
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Container(
                      child: Text(
                        'SAVE DOCUMENTS',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      child: Text(
                        ' No need of worrying where \n to save files. Save and Convert \n into PDF Files at one go !!',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0xFFD7F507), const Color(0xFF90ADBD)],
                    /*FF9CDE*/
                    begin: FractionalOffset.topRight,
                    end: FractionalOffset.bottomLeft,
                    stops: [
                      0.0,
                      1.0
                    ], // the array of  values inside stops basically say how the colors merge with each other
                    tileMode: TileMode
                        .clamp, //How this gradient should tile the plane beyond in the region before begin and after end.
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 54,
                    ),
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        'assets/images/undraw_share_766i (1).png',
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      child: Text(
                        'SHARE',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      child: Text(
                        ' Now easily share documents \n and files via Whatsapp, email \n or other social networks !!',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text('GET STARTED'),
                          textColor: Colors.white,
                          elevation: 4,
                          color: Colors.black38,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
