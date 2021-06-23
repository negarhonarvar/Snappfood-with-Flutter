import 'package:flutter/material.dart';
import 'package:snappfood/cursorchanger/bottom_nav_bar.dart';
import 'package:snappfood/Screens/home/comps/app_bar.dart';
import 'package:snappfood/Screens/home/comps/body.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: BottomNavBar(),
      body: Body(),
    );
  }
}