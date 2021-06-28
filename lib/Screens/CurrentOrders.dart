import 'package:flutter/material.dart';
import 'package:snappfood/Screens/Dish.dart';
import 'package:snappfood/cursorchanger/textcontainer.dart';

class CurrentOrders extends StatefulWidget {

  @override
  _CurrentOrdersState createState() => _CurrentOrdersState();
}

class _CurrentOrdersState extends State<CurrentOrders> {
  List<Dish> _dishes = List<Dish>();

  bool pressGeoON = false;
  bool cmbscritta = false;

  bool pressGeoON1 = false;
  bool cmbscritta1= false;
  @override
  Widget build(BuildContext context) {
    _populateDishes();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Reviews", style: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 50,//chang
          opacity: 20,// e your color here
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10,10,10,0),
              height: 220,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 5),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Image.asset("assets/images/Shabdiz.jpg",height: 150,width: 150),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                height: 140,
                                                child:Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.topLeft,
                                                      child:Text(_dishes.elementAt(1).name,style: TextStyle(fontSize: 20),),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.topLeft,
                                                      child:Text(_dishes.elementAt(1).Cost,style: TextStyle(fontSize: 20),),
                                                    ),
                                                    RaisedButton(

                                                      color: pressGeoON ? Colors.grey : Colors.red,
                                                      child:cmbscritta?Text("in progress"):Text("ready"),
                                                      onPressed:(){
                                                        setState(() {
                                                          pressGeoON = !pressGeoON;
                                                          cmbscritta = !cmbscritta;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10,10,10,0),
              height: 220,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 5),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Image.asset("assets/images/mushroomburger.jpeg",height: 150,width: 150),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                height: 140,
                                                child:Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.topLeft,
                                                      child:Text(_dishes.elementAt(1).name,style: TextStyle(fontSize: 20),),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.topLeft,
                                                      child:Text(_dishes.elementAt(1).Cost,style: TextStyle(fontSize: 20),),
                                                    ),
                                                    RaisedButton(
                                                      color: pressGeoON1 ? Colors.grey : Colors.red,
                                                      child:cmbscritta1?Text("in progress"):Text("ready"),
                                                      onPressed:(){

                                                        setState(() {
                                                          pressGeoON1 = !pressGeoON1;
                                                          cmbscritta1 = !cmbscritta1;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _populateDishes() {
    var list = <Dish>[
      Dish(
        name:'cheeseburger',
        Count:1,
        Cost: "80000 Toman",
        Code:"1238664584",
        /*imagePath:"assets/cheeseburger.jpg",*/
      ),
       /*Dish(
        name:'mushroom burger',
        Count: 0,
        Cost: "80000 Toman",
        imagePath:("assets/mushroomburger.jpeg"),
      ),*/
      Dish(
        name:'pepperoni',
        Count: 0,
        Cost: "80000 Toman",
        Code:"12386643532",
        /*imagePath:"assets/images/Shabdiz.jpg",*/
      ),
    ];

    _dishes = list;
  }
}
