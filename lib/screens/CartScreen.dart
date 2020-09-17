import 'package:flutter/material.dart';
import 'package:java_practice/components/BackGroundWidget.dart';
import 'package:java_practice/components/CustomCard.dart';
import 'package:java_practice/components/TopLeftTag.dart';
import 'package:java_practice/models/model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatefulWidget {
  static const String id = 'cart_screen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Widget updatedListView() {
    return ScopedModelDescendant<CartModel>(
      rebuildOnChange: true,
      builder: (context, child, model) => model.items.length == 0
          ? Center(
              child: Text('Cart Empty🙁'),
            )
          : ListView.builder(
              itemCount: model.items.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomCard(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(19.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          '${model.items[index]}',
                          maxLines: null,
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      MaterialButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () {
                          setState(
                            () {
                              CartModel.of(context).removeItem(index);
                            },
                          );
                        },
                        child: Text(
                          'Remove',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  alignment: MainAxisAlignment.center,
                  onTap: () {},
                );
              },
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundWidget(),
          TopLeftTag(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Positioned(
            top: 50.0,
            left: (MediaQuery.of(context).size.width / 2) - 60.0,
            child: Text(
              'My Cart',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 600.0,
              child: updatedListView(),
            ),
          )
        ],
      ),
    );
  }
}
