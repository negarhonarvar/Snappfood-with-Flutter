import 'package:flutter/material.dart';
import 'package:snappfood/Screens/EditMenu.dart';

class MainPanel extends StatefulWidget {
  @override
  _MainPanelState createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text("SnappFood", style: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 50,//chang
          opacity: 20,// e your color here
        ),
        backgroundColor: Colors.white,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            /*padding: const EdgeInsets.all(5),*/
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                child: Card(
                    color: Colors.white,
                    child: Center(child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(child: Image.asset("assets/images/editMenu.png",
                            height: 70, width: 70,),),
                          Text("Edit Menu", style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold),),
                          Padding(padding: EdgeInsets.only(bottom: 15),),
                        ]
                    ),
                    )
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditMenu(),
                    ),
                  );
                },
              ),

            ),
            color: Colors.grey[100],
          ),
          Container(
            /*padding: const EdgeInsets.all(5),*/
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                  child: Card(
                      color: Colors.white,
                      child: Center(child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(child: Image.asset("assets/images/feedback.png",
                              height: 70, width: 70,),),
                            Text("Reviews", style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold),),
                            Padding(padding: EdgeInsets.only(bottom: 15),),
                          ]
                      ),
                      )
                  ),
                  onTap: () {}
              ),

            ),
            color: Colors.grey[100],
          ),
          Container(
            /*padding: const EdgeInsets.all(5),*/
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                  child: Card(
                      color: Colors.white,
                      child: Center(child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(child: Image.asset("assets/images/waiting.png",
                              height: 70, width: 70,),),
                            Text("History Of Orders", style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),),
                            Padding(padding: EdgeInsets.only(bottom: 15),),
                          ]
                      ),
                      )
                  ),
                  onTap: () {}
              ),

            ),
            color: Colors.grey[100],
          ),
          Container(
            /*padding: const EdgeInsets.all(5),*/
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                  child: Card(
                      color: Colors.white,
                      child: Center(child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(child: Image.asset("assets/images/ordering.png",
                              height: 90, width: 90,),),
                            Text("Current Orders", style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),),
                            Padding(padding: EdgeInsets.only(bottom: 15),),
                          ]
                      ),
                      )
                  ),
                  onTap: () {}
              ),

            ),
            color: Colors.grey[100],
          ),
          Container(
            /*padding: const EdgeInsets.all(8),*/
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  child: Card(
                      color: Colors.white,
                      child: Center(child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(child: Image.asset("assets/images/area2.png",
                              height: 70, width: 70,),),
                            Text("Round Area", style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold),),
                            Padding(padding: EdgeInsets.only(bottom: 15),),
                          ]
                      ),
                      )
                  ),
                  onTap: () {}
              ),

            ),
            color: Colors.grey[100],
          ),
        ],
      ),
    );
  }
}