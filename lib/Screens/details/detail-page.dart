import 'package:flutter/material.dart';
import 'package:snappfood/Screens/constcolores.dart';
import 'package:snappfood/Screens/details/comps/app_bar.dart';
import 'package:snappfood/Screens/details/comps/body.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(),
      body: Body(),
    );
  }
}