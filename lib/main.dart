import 'package:flutter/material.dart';
import 'package:java_practice/screens/AboutScreen.dart';
import 'package:java_practice/screens/FormScreen.dart';
import 'package:java_practice/screens/CartScreen.dart';
import 'package:java_practice/screens/HomeScreen.dart';
import 'package:java_practice/screens/MerchScreen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:java_practice/models/model.dart';

void main() {
  runApp(KooProject());
}

class KooProject extends StatelessWidget {
  final CartModel cartModel = CartModel();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CartModel>(
      model: cartModel,
      child: MaterialApp(
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          MerchScreen.id: (context) => MerchScreen(),
          CartScreen.id: (context) => CartScreen(),
          FormScreen.id: (context) => FormScreen(),
          AboutScreen.id: (context) => AboutScreen(),
        },
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
