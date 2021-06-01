import 'package:flutter/material.dart';
import 'package:snappfood/cursorchanger/textcontainer.dart';
import 'package:snappfood/Screens/constcolores.dart';

class AddressInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const AddressInputField({
    Key key,
    this.hintText,
    this.icon = Icons.add_location,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}