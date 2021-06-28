import 'package:flutter/material.dart';
import 'package:snappfood/Screens/Cart.dart';
import 'package:snappfood/Screens/Dish.dart';


class Order extends StatelessWidget {
  String t;
  String str;
  @override
  Widget build(BuildContext context) {

   /* final List<String> _tabs = <String>[
      "Active Orders",
      "Inactive Orders",
    ];*/

    return /*Scaffold(*/
      DefaultTabController(
        length: 2,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              bottom:PreferredSize(
                preferredSize: Size(70,70),
                child: Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child:TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50), // Creates border
                        color: Colors.black26),
                    isScrollable: true,
                    indicatorColor: Colors.black,
                    onTap: (index) {
                      // Tab index when user select it, it start from zero
                    },
                    tabs: [
                      Container(
                        height: 40,
                        child:Align(
                          alignment: Alignment.center,
                          child:Text("Active Orders",style: TextStyle(color: Colors.grey[700],fontSize: 20),),
                        ),
                      ),
                      Container(
                        height: 40,
                        child:Align(
                          alignment: Alignment.center,
                          child:Text("Inactive Orders",style: TextStyle(color: Colors.grey[700],fontSize: 20),),
                        ),
                      ),
                      /*Container(
                      height: 40,
                      child:Align(
                        alignment: Alignment.center,
                        child:Text("All",style: TextStyle(color: Colors.grey[700],fontSize: 20),),
                      ),
                    ),*/
                    ],
                  ),
                ),
              ),
              centerTitle: true,
              title: Text("Orders",style:TextStyle(
                  color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
              backgroundColor: Colors.white,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                  child: GestureDetector(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart,
                          size: 36.0,
                          color: Colors.black26,
                        ),
                        if (Restaurant2.cartList.length > 0)
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),

                            child: CircleAvatar(
                              radius: 8.0,
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              child: Text(
                                Restaurant2.cartList.length.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    onTap: () {
                      if (Restaurant2.cartList.isNotEmpty)
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Cart(Restaurant2.cartList),
                          ),
                        );
                    },
                  ),
                )
              ],
            ),
            body: TabBarView(
              children: [
                Restaurant2(),
                Restaurant3(),
                /*All(EditMenu.list),*/
              ],
            ),
          ),
        ),
      );
  }
}


Widget ActiveOrders() {
  List<Dish> _dishes = List<Dish>();
  List<Dish> _cartList = List<Dish>();
  return GridView.builder(
      padding: const EdgeInsets.all(4.0),
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _dishes.length,
      itemBuilder: (context, index) {
        var item = _dishes[index];
        return Card(
            elevation: 4.0,
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /* Image.asset(
                          item.imagePath
                      ),*/
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subhead,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    bottom: 8.0,
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.green,
                      ),
                      onTap: () {
                        if (!_cartList.contains(item))
                          _cartList.add(item);
                        else {
                          item.Count++;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
        );
      });
}
Widget InctiveOrders(){
  return SafeArea(
    top: false,
    bottom: false,
    child: Builder(
      builder: (BuildContext context) {
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            return true;
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            color:Colors.pink[100],
                            height: 300,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 200,
                                  child:Center(
                                    child: Text("Salam"),
                                  ),
                                ),
                                SizedBox(
                                    height: 100,
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          flex:1,
                                          child:Padding(
                                            padding: EdgeInsets.only(top: 30,bottom: 30,left: 5,right: 5),
                                            child: RaisedButton(
                                              color: Colors.pink,
                                              child: Center(
                                                child: Text("Buy"),
                                              ),
                                              elevation: 5.0,
                                              shape:RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(15.0),
                                                side: BorderSide(color: Colors.black),
                                              ),
                                              onPressed: (){},
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex:1,
                                          child:Padding(
                                            padding: EdgeInsets.only(top: 30,bottom: 30,left: 5,right: 5),
                                            child: RaisedButton(

                                              color: Colors.pink,
                                              child: Center(
                                                child: Text("Buy"),
                                              ),
                                              elevation: 5.0,
                                              shape:RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(15.0),
                                                side: BorderSide(color: Colors.black),
                                              ),
                                              onPressed: (){},
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    },
                    childCount: 3,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}


class Restaurant2 extends StatefulWidget {
  static List<Dish> cartList = List<Dish>();
  Restaurant2({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Restaurant2State createState() => _Restaurant2State();
}

class _Restaurant2State extends State<Restaurant2> {
  List<Dish> _dishes = List<Dish>();

  List<Dish> _cartList = Restaurant2.cartList;///////////////////////////


  @override
  void initState() {
    super.initState();
    _populateDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildGridView(),
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: _dishes.length,
        itemBuilder: (context, index) {
          var item = _dishes[index];
          return Card(
              elevation: 4.0,
              child: Stack(
                /*fit: StackFit.loose,*/
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Column(
                    /*mainAxisAlignment: MainAxisAlignment.spaceEvenly,*/
                    children: <Widget>[
                      SizedBox(height: 20,),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/images/Shabdiz.jpg"),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        item.name,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      SizedBox(height: 5,),
                      Text(
                        item.Cost,
                        /*textAlign: TextAlign.center,*/
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "Code:"+item.Code,
                        /*textAlign: TextAlign.center,*/
                        style: Theme.of(context).textTheme.subhead,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child:RaisedButton(
                        color: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.deepOrange),
                        ),
                        child: Text("Buy"),
                        onPressed: () {
                          setState(() {
                            if (!_cartList.contains(item))
                              _cartList.add(item);
                            else{
                              item.Count++;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
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
      /* Dish(
        name:'mushroom burger',
        Count: 0,
        Cost: "80000 Toman",
        imagePath:("assets/mushroomburger.jpeg"),
      ),
      Dish(
        name:'pepperoni',
        Count: 0,
        Cost: "80000 Toman",
        imagePath:("assets/pepperoni.jpg"),
      ),*/
    ];

    setState(() {
      _dishes = list;
    });
  }
}



class Restaurant3 extends StatefulWidget {
  static List<Dish> cartList = List<Dish>();
  Restaurant3({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Restaurant3State createState() => _Restaurant3State();
}

class _Restaurant3State extends State<Restaurant3> {
  List<Dish> _dishes = List<Dish>();

  List<Dish> _cartList = Restaurant2.cartList;///////////////////////////


  @override
  void initState() {
    super.initState();
    _populateDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildGridView(),
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: _dishes.length,
        itemBuilder: (context, index) {
          var item = _dishes[index];
          return Card(
              elevation: 4.0,
              child: Stack(
                /*fit: StackFit.loose,*/
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Column(
                    /*mainAxisAlignment: MainAxisAlignment.spaceEvenly,*/
                    children: <Widget>[
                      SizedBox(height: 20,),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/images/Shabdiz.jpg"),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        item.name,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      SizedBox(height: 5,),
                      Text(
                        item.Cost,
                        /*textAlign: TextAlign.center,*/
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child:RaisedButton(
                        color: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.deepOrange),
                        ),
                        child: Text("Buy"),
                        onPressed: () {
                          setState(() {
                            if (!_cartList.contains(item))
                              _cartList.add(item);
                            else{
                              item.Count++;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  void _populateDishes() {
    var list = <Dish>[
      Dish(
        name:'cheeseburger',
        Count:1,
        Cost: "80000 Toman",
        /*imagePath:"assets/cheeseburger.jpg",*/
      ),
      /* Dish(
        name:'mushroom burger',
        Count: 0,
        Cost: "80000 Toman",
        imagePath:("assets/mushroomburger.jpeg"),
      ),
      Dish(
        name:'pepperoni',
        Count: 0,
        Cost: "80000 Toman",
        imagePath:("assets/pepperoni.jpg"),
      ),*/
    ];

    setState(() {
      _dishes = list;
    });
  }
}