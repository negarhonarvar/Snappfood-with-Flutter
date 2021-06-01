import 'package:flutter/material.dart';
import 'package:snappfood/cursorchanger/textcontainer.dart';
import 'package:snappfood/Screens/constcolores.dart';
import 'package:snappfood/logics/foodcat.dart';

class FoodCategoreyInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const FoodCategoreyInputField({
    Key key,
    this.hintText,
    this.icon = Icons.fastfood,
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
/*class Choosing extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const Choosing({
    Key key,
    this.hintText,
    this.icon = Icons.fastfood,
    this.onChanged,
  }) : super(key: key);

  @override
  State<Choosing> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<Choosing> {
  foodcat _character = foodcat.iranian_traditional;
   final String hintText;
   final IconData icon;
   final ValueChanged<String> onChanged;
   _MyStatefulWidgetState({
    final Key key,
    this.hintText,
    this.icon = Icons.fastfood,
    this.onChanged,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
         children: <Widget>[
            TextFieldContainer(
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
            ),
            ListTile(
              title: const Text('Fast Food'),
              leading: Radio<foodcat>(
                value: foodcat.fast_food,
                groupValue: _character,
                onChanged: (foodcat value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Diet Food'),
              leading: Radio<foodcat>(
                value: foodcat.diet,
                groupValue: _character,
                onChanged: (foodcat value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Iranian Traditional Food'),
              leading: Radio<foodcat>(
                value: foodcat.iranian_traditional,
                groupValue: _character,
                onChanged: (foodcat value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Italian Food'),
              leading: Radio<foodcat>(
                value: foodcat.italian,
                groupValue: _character,
                onChanged: (foodcat value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Local Food'),
              leading: Radio<foodcat>(
                value: foodcat.local_food,
                groupValue: _character,
                onChanged: (foodcat value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Sea Food'),
              leading: Radio<foodcat>(
                value: foodcat.Sea_food,
                groupValue: _character,
                onChanged: (foodcat value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
