import 'package:flutter/material.dart';
import 'package:java_practice/components/BackGroundWidget.dart';
import 'package:java_practice/components/Products.dart';
import 'package:java_practice/components/TopLeftTag.dart';
import 'package:java_practice/models/model.dart';
import 'package:java_practice/screens/CartScreen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:java_practice/components/CustomCard.dart';

class MerchScreen extends StatelessWidget {
  static const String id = 'merch_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundWidget(),
          TopLeftTag(
            child: ScopedModelDescendant<CartModel>(
              rebuildOnChange: true,
              builder: (context, child, model) => Stack(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 30.0,
                  ),
                  Positioned(
                    left: 15.0,
                    bottom: 15.0,
                    child: CircleAvatar(
                      radius: 7.0,
                      backgroundColor: Colors.red,
                      child: Text(
                        '${model.items.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.id);
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Card(
              child: Container(
                height: 600.0,
                width: MediaQuery.of(context).size.width - 20.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 80.0,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: GridView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 50.0,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomCard(
                          color: Colors.deepPurple.shade900,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          onTap: () {
                            CartModel.of(context)
                                .addItem(products[index]['name']);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  '${products[index]['name']}',
                                  maxLines: null,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                '${products[index]['price']}\n${products[index]['stocking']}',
                                maxLines: null,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ],
                          ),
                          alignment: MainAxisAlignment.center,
                        );
                      },
                    ),
                  ),
                ),
              ),
              elevation: 0.0,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Opacity(
        opacity: 0.8,
        child: FloatingActionButton(
          splashColor: Colors.blueGrey,
          elevation: 20.0,
          backgroundColor: Colors.purple[430],
          child: Icon(
            Icons.home,
            size: 40.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
