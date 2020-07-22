import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class AboutUsScreen extends StatelessWidget {
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
            child: Text('About Us'),
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
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Who We Are !!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        'Ultrabot Innovations is a Recruitment Marketplace '
                        'and HR Tech Company. We are very active and focused in Staffing '
                        'and Recruitment Business. The vision of Ultrabot Recruitment'
                        ' is to fill the gap between company and candidate. '
                        'Ultrabot finds best candidates for Clients.'
                        ' We try to hire the candidates for most loving and fun'
                        ' workplace where the candidates get their chances to grow higher.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(height: 25),
                    Container(
                      child: Text(
                        'Curious to Know More',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12),
                        child: Text(
                            'Check our Social Media Handles to know more.'),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SocialMediaButton.facebook(
                          url:
                              "https://www.facebook.com/Ultrabot-Innovations-private-limited-1925245837604565/",
                          size: 35,
                          color: Colors.white,
                        ),
                        SocialMediaButton.twitter(
                          url: "https://twitter.com/UltrabotI",
                          size: 35,
                          color: Colors.white,
                        ),
                        SocialMediaButton.instagram(
                          url: "https://www.instagram.com/ultronics__/",
                          size: 35,
                          color: Colors.white,
                        ),
                        SocialMediaButton.linkedin(
                          url:
                              "https://www.linkedin.com/company/ultrabot-innovations/",
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
      ),
    );
  }
}
