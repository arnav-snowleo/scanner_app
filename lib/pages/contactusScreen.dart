import 'package:flutter/material.dart';

//import 'package:url_launcher/url_launcher.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class ContactUsScreen extends StatelessWidget {
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
            child: Text('Contact Us'),
          ),
        ),
        body: Container(
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
              padding: const EdgeInsets.all(35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Get In Touch',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        child: Text(
                          'test@gmail.com',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Container(
                        child: Text(
                          '+91797*******',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 180),
                  Container(
                    child: Text('My Social Media Handles!!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        )),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SocialMediaButton.facebook(
                        url: "https://www.facebook.com/arnav.satrusal.3",
                        size: 35,
                        color: Colors.white,
                      ),
                      SocialMediaButton.twitter(
                        url: "https://twitter.com/ASatrusal",
                        size: 35,
                        color: Colors.white,
                      ),
                      SocialMediaButton.instagram(
                        url: "https://www.instagram.com/arnavsatrusal__/?hl=en",
                        size: 35,
                        color: Colors.white,
                      ),
                      SocialMediaButton.linkedin(
                        url:
                            "https://www.linkedin.com/in/arnavsatrusal/",
                        size: 35,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
