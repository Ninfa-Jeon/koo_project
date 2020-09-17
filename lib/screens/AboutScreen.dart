import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:java_practice/components/BackGroundWidget.dart';
import 'package:java_practice/components/TopLeftTag.dart';

class AboutScreen extends StatefulWidget {
  static const String id = 'about_screen';

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<Widget> about(Map aboutData) {
    if (aboutData == null) return [SizedBox()];
    List<Widget> about = [];
    for (var data in aboutData.keys) {
      if (data == "") {
        about.add(
          Text(
            '${aboutData[data]}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0),
          ),
        );
      } else {
        about.add(
          Text(
            '${data.toUpperCase()}: ${aboutData[data]}',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }
    }
    return about;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundWidget(),
          TopLeftTag(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 10,
            left: (MediaQuery.of(context).size.width / 2) - 60.0,
            child: Text(
              'ABOUT',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Opacity(
              opacity: 0.7,
              child: Card(
                elevation: 0.0,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Container(
                  height: 550.0,
                  width: MediaQuery.of(context).size.width - 20.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: FutureBuilder(
                      future: DefaultAssetBundle.of(context)
                          .loadString("assets/quotes.json"),
                      builder: (context, snapshot) {
                        Map aboutData = json.decode(snapshot.data.toString());
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: about(aboutData),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
