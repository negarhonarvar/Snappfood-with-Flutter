import 'package:flutter/material.dart';
import 'package:snappfood/Screens/Dish.dart';

class Cart extends StatefulWidget {
  int FinalCost;
  final List<Dish> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);

  List<Dish> _cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: _cart.length,
          itemBuilder: (context, index) {
            var item = _cart[index];
            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  /*leading: Image.asset(
                      item.imagePath
                  ),*/
                  title: Text(item.name),
                  leading: Text(item.Count.toString()),
                  trailing: Wrap(
                    spacing: 12, // space between two icons
                    children: <Widget>[
                      GestureDetector(
                          child:Icon(
                            Icons.add_circle,
                            color: Colors.green,
                          ),
                          onTap: () {
                            setState(() {
                              item.Count++;
                            });
                          }), // icon-1
                      GestureDetector(
                          child:Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                          onTap: () {
                            setState(() {
                              if(item.Count>0){
                                item.Count--;
                              }
                              else{
                                _cart.remove(item);
                              }
                            });
                          }), // icon-2
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}