import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:java_practice/components/CustomCard.dart';
import 'package:java_practice/components/BackGroundWidget.dart';
import 'package:java_practice/screens/AboutScreen.dart';
import 'package:java_practice/screens/MerchScreen.dart';
import 'package:java_practice/components/TopLeftTag.dart';
import 'package:java_practice/screens/FormScreen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundWidget(),
          Positioned(
            top: MediaQuery.of(context).size.height / 3.8,
            left: MediaQuery.of(context).size.width / 8,
            child: Text(
              'Jeon Jungkook',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontFamily: 'Pacifico',
              ),
            ),
          ),
          TopLeftTag(
            onPressed: () {
              Navigator.pushNamed(context, AboutScreen.id);
            },
            child: Icon(
              Icons.grade,
              size: 30.0,
            ),
          ),
          Positioned(
            top: 50.0,
            left: (MediaQuery.of(context).size.width / 2.0) - 70,
            right: (MediaQuery.of(context).size.width / 2.0) - 70,
            child: Card(
              elevation: 20.0,
              shadowColor: Colors.black,
              shape: CircleBorder(),
              child: ClipOval(
                child: Image.asset(
                  'assets/jungkook.jpg',
                  width: 200.0,
                  height: 125.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 450.0,
            bottom: 260.0,
            left: 10.0,
            right: 10.0,
            child: CustomCard(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onTap: () {
                Navigator.pushNamed(context, FormScreen.id);
              },
              textPrompt: 'Send love?',
              emoji: '💜',
              alignment: MainAxisAlignment.end,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 250.0,
            bottom: 50.0,
            left: 10.0,
            right: 10.0,
            child: CustomCard(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onTap: () {
                Navigator.pushNamed(context, MerchScreen.id);
              },
              textPrompt: 'Buy merch!',
              emoji: '🛒',
              alignment: MainAxisAlignment.start,
            ),
          ),
        ],
      ),
    );
  }
}
