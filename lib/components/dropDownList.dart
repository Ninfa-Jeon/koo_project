import 'package:flutter/material.dart';

List dropDownList = ['Urgent', 'Not Urgent', 'None', 'Gift', 'Attachment'];

List<DropdownMenuItem> getDropDownItems() {
  List<DropdownMenuItem> menuItems = [];
  for (String item in dropDownList) {
    menuItems.add(DropdownMenuItem(
      child: Text(item),
      value: item,
    ));
  }
  return menuItems;
}

List<Widget> getPickerItems() {
  List<Widget> pickerItems = [];
  for (String item in dropDownList) {
    pickerItems.add(Text(item));
  }
  return pickerItems;
}
