import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:java_practice/components/BackGroundWidget.dart';
import 'package:java_practice/components/TopLeftTag.dart';
import 'dart:io' show Platform;

import 'package:java_practice/components/dropDownList.dart';

class FormScreen extends StatefulWidget {
  static const String id = 'form_screen';
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String choice = 'Choose flag';
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  DropdownButton getAndroidDropDown() {
    return DropdownButton(
      style: TextStyle(
        color: Colors.deepPurple,
        fontSize: 20.0,
      ),
      hint: Text(choice),
      isExpanded: true,
      items: getDropDownItems(),
      onChanged: (value) {
        setState(
          () {
            choice = value;
          },
        );
      },
    );
  }

  CupertinoPicker getIOSPicker() {
    return CupertinoPicker(
      itemExtent: 32,
      children: getPickerItems(),
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          choice = dropDownList[selectedIndex];
        });
      },
    );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackGroundWidget(),
          TopLeftTag(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Opacity(
              opacity: 0.6,
              child: Card(
                child: Container(
                  height: 600.0,
                  width: MediaQuery.of(context).size.width - 20.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 50.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Platform.isIOS
                              ? getIOSPicker()
                              : getAndroidDropDown(),
                          TextFormField(
                            controller: controller1,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 20.0,
                              ),
                              errorStyle: TextStyle(
                                fontSize: 15.0,
                              ),
                              hintText: 'Enter title of message',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            controller: controller2,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 20.0,
                              ),
                              errorStyle: TextStyle(
                                fontSize: 15.0,
                              ),
                              hintText: 'Enter your message',
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 8,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          FlatButton(
                            textColor: Colors.white,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SimpleDialog(
                                      titlePadding: EdgeInsets.only(
                                        left: 50.0,
                                        right: 50.0,
                                        top: 30.0,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 50.0,
                                        vertical: 30.0,
                                      ),
                                      title: Text('Contents'),
                                      elevation: 20.0,
                                      backgroundColor: Colors.white,
                                      children: [
                                        Text('Flag: $choice'),
                                        Text('Title: ${controller1.text}'),
                                        Text('Message: ${controller2.text}'),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Text('Send!!'),
                            color: Colors.deepPurple,
                            splashColor: Colors.blueGrey,
                          ),
                        ],
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
          ),
        ],
      ),
    );
  }
}
