import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Function onTap;
  final String textPrompt;
  final ShapeBorder shape;
  final String emoji;
  final Widget child;
  final Color color;
  final MainAxisAlignment alignment;
  const CustomCard(
      {Key key,
      this.child,
      this.onTap,
      this.textPrompt,
      this.emoji,
      this.alignment,
      this.shape,
      this.color: Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          width: 250.0,
          child: RaisedButton(
            disabledColor: Colors.white,
            splashColor: Colors.blueGrey,
            onPressed: onTap,
            elevation: 10.0,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(20.0),
            // ),
            shape: shape,
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child ??
                  Row(
                    mainAxisAlignment: alignment,
                    children: [
                      Flexible(
                        child: Text(
                          textPrompt,
                          maxLines: null,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'Pacifico',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        emoji,
                        style: TextStyle(fontSize: 50.0),
                      ),
                    ],
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
