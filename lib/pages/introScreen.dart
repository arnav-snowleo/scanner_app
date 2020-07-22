import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'file:///C:/Users/CHINU/Desktop/new-master/lib/camera/mainScreen.dart';

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
                color: Colors.blueGrey,
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
                color: Colors.blueGrey[600],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 124,
                    ),
                    Container(
                      child: Icon(
                        Icons.library_books,
                        size: 135,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 72,
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
                      height: 16,
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
                      height: 150,
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
                color: Colors.blueGrey[700],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 114,
                    ),
                    Container(
                      child: Icon(
                        Icons.send,
                        size: 135,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 52,
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
                      height: 80,
                    ),
                    Container(
                      child: RaisedButton(
                          child: Text('NEXT'),
                          textColor: Colors.white,
                          elevation: 4,
                          color: Colors.black38,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MainScreen(),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 60,
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
