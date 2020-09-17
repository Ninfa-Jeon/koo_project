import 'package:flutter/material.dart';

class TopLeftTag extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  TopLeftTag({this.child, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30.0,
      right: MediaQuery.of(context).size.width - 80.0,
      child: Opacity(
        opacity: 0.5,
        child: RaisedButton(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
              topLeft: Radius.circular(0.0),
              bottomLeft: Radius.circular(0.0),
            ),
          ),
          elevation: 20.0,
          color: Colors.white,
          child: child,
          splashColor: Colors.blueGrey,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
