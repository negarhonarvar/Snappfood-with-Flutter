import 'package:flutter/material.dart';
import 'package:snappfood/cursorchanger/search_box.dart';
import 'package:snappfood/Screens/home/comps/category_list.dart';
import 'package:snappfood/Screens/home/comps/discount_card.dart';
import 'package:snappfood/Screens/home/comps/item_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBox(
            onChanged: (value) {},
          ),
          CategoryList(),
          ItemList(),
          DiscountCard(),
        ],
      ),
    );
  }
}