import 'package:flutter/material.dart';
import 'package:snappfood/Screens/constcolores.dart';
class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                  itemExtent: 150,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.all(5.0),
                    color: gradiantColor,
                  ),
                  itemCount: 2),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                margin: EdgeInsets.all(5.0),
                color: gradiantColorlight,
              ),
            ),
          )
        ],
      ),
    );
  }
}