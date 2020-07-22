import 'package:flutter/material.dart';

class DocumentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 78.0),
            child: Text('Documents'),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xFF3F51B5), const Color(0xFF9FA8DA)],
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
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Lorem Ipsum',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text('Lorem ipsum is simply dummy Text Lorem'
                          ' ipsum is simply dummy Text Lorem ipsum is simply '
                          'Lorem ipsum is simply dummy TextLorem ipsum is simply '
                          'dummy Text Lorem ipsum is simply dummy Text '
                          'dummy Text Lorem ipsum is simply dummy TextLorem ipsum'
                          ' is simply dummy Text'),
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Text(
                        'Lorem Ipsum',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text('Lorem ipsum is simply dummy Text Lorem'
                          ' ipsum is simply dummy Text Lorem ipsum is simply '
                          'Lorem ipsum is simply dummy TextLorem ipsum is simply '
                          'dummy Text Lorem ipsum is simply dummy Text '
                          'dummy Text Lorem ipsum is simply dummy TextLorem ipsum'
                          ' is simply dummy Text'),
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Text(
                        'Lorem Ipsum',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text('Lorem ipsum is simply dummy Text Lorem'
                          ' ipsum is simply dummy Text Lorem ipsum is simply '
                          'Lorem ipsum is simply dummy TextLorem ipsum is simply '
                          'dummy Text Lorem ipsum is simply dummy Text '
                          'dummy Text Lorem ipsum is simply dummy TextLorem ipsum'
                          ' is simply dummy Text'),
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Text(
                        'Lorem Ipsum',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text('Lorem ipsum is simply dummy Text Lorem'
                          ' ipsum is simply dummy Text Lorem ipsum is simply '
                          'Lorem ipsum is simply dummy TextLorem ipsum is simply '
                          'dummy Text Lorem ipsum is simply dummy Text '
                          'dummy Text Lorem ipsum is simply dummy TextLorem ipsum'
                          ' is simply dummy Text'),
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Text(
                        'Lorem Ipsum',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text('Lorem ipsum is simply dummy Text Lorem'
                          ' ipsum is simply dummy Text Lorem ipsum is simply '
                          'Lorem ipsum is simply dummy TextLorem ipsum is simply '
                          'dummy Text Lorem ipsum is simply dummy Text '
                          'dummy Text Lorem ipsum is simply dummy TextLorem ipsum'
                          ' is simply dummy Text'),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
