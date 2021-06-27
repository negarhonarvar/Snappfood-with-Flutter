import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snappfood/logics/FoodRe.dart';
import 'package:snappfood/logics/PizzaList.dart';
import 'package:snappfood/logics/DrinksList.dart';
import 'package:snappfood/logics/HamburgerList.dart';


class EditMenu extends StatefulWidget {
  static List<FoodRe> list;
  const EditMenu({Key key}) : super(key: key);

  @override
  _EditMenuState createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                        child:Text("Drinks",style: TextStyle(color: Colors.grey[700],fontSize: 20),),
                      ),
                    ),
                    Container(
                      height: 40,
                      child:Align(
                        alignment: Alignment.center,
                        child:Text("Pizza",style: TextStyle(color: Colors.grey[700],fontSize: 20),),
                      ),
                    ),
                    Container(
                      height: 40,
                      child:Align(
                        alignment: Alignment.center,
                        child:Text("Hamburger",style: TextStyle(color: Colors.grey[700],fontSize: 20),),
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
            title: Text("SnappFood",style:TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.white,
          ),
          body: TabBarView(
            children: [
              Drinks(EditMenu.list),
              Pizza(EditMenu.list),
              Hamburger(EditMenu.list),
              /*All(EditMenu.list),*/
            ],
          ),
        ),
      ),
    );
  }
}
class Hamburger extends StatefulWidget {
  static List<FoodRe> list;
  Hamburger(List<FoodRe> list){
    list=list;
  }
  @override
  _HamburgerState createState() => _HamburgerState();
}
class _HamburgerState extends State<Hamburger> {
  bool pressGeoON = false;
  bool cmbscritta = false;
  var _formKey=GlobalKey<FormState>();
  String title;
  Image image=Image.asset("assets/images/NoPhoto.png");
  String description;
  String cost;
  @override
  Widget build(BuildContext context) {
    String tap1="Available";
    String tap2="Unavailable";
    return Scaffold(
      body:Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child:Container(
          child: ListView(
            children: List.generate(
              HamburgerList.getFood().length,
                  (index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: ListTile(
                    leading:Image.asset(HamburgerList.getFood().elementAt(index).image),
                    title:Text(HamburgerList.getFood().elementAt(index).getTitle()),
                    subtitle:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(HamburgerList.getFood().elementAt(index).getDescription()),
                          RichText(
                            text:TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: "Cost:",style: TextStyle(color: Colors.black87),),
                                TextSpan(text: HamburgerList.getFood().elementAt(index).getCost(),style: TextStyle(color: Colors.black54)),
                                TextSpan(text: " Toman",style: TextStyle(color: Colors.black87),),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: cmbscritta ? tap1 : tap2,
                              style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 15),
                              recognizer: new TapGestureRecognizer()..onTap = () => setState(() {
                                pressGeoON = !pressGeoON;
                                cmbscritta = !cmbscritta;
                              }),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Delete",
                              style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,fontSize: 15),
                              recognizer: new TapGestureRecognizer()..onTap = () => setState(() {
                                print(index);
                                HamburgerList.getFood().removeAt(index);
                              }),
                            ),
                          ),
                        ]
                    ),
                    trailing:RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.deepOrange)),
                            onPressed: () {
                              showModalBottomSheet(context: context,
                                builder: (context)=>Container(
                                  padding: EdgeInsets.all(15),
                                  child: Form(
                                    key: _formKey,
                                    child: ListView(
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(labelText: "Title",
                                            labelStyle: (TextStyle(color: Colors.deepOrange)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.deepOrange
                                                )
                                            ),
                                          ),
                                          onSaved: (String value){
                                            title=value;
                                          },
                                          /*validator: (String value){
                                            if(value.isEmpty || value==null){
                                              title=HamburgerList.getFood().elementAt(index-1).title;
                                            }
                                          },*/
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 4,
                                          decoration: InputDecoration(labelText: "Description",
                                            labelStyle: (TextStyle(color: Colors.deepOrange)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.deepOrange
                                                )
                                            ),
                                          ),
                                          onSaved: (String value){
                                            description=value;
                                          },
                                          /*validator: (String value){
                                            if(value.isEmpty || value==null){

                                              *//*return "Required";*//*
                                            }
                                          },*/
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(labelText: "Cost",
                                            labelStyle: (TextStyle(color: Colors.deepOrange)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.deepOrange
                                                )
                                            ),
                                          ),
                                          onSaved: (String value){
                                            cost=value;
                                          },
                                          /*validator: (String value){
                                            if(value.isEmpty || value==null){
                                              return "Required";
                                            }
                                          },*/
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.deepOrange,
                                            ),
                                            onPressed: (){

                                              if(_formKey.currentState.validate()){
                                                setState(() {
                                                  _formKey.currentState.save();
                                                  if(title==""){
                                                    title=HamburgerList.getFood().elementAt(index).title;
                                                  }
                                                  if(description==""){
                                                    description=HamburgerList.getFood().elementAt(index).description;
                                                  }
                                                  if(cost==""){
                                                    cost=HamburgerList.getFood().elementAt(index).cost;
                                                  }
                                                  HamburgerList.getFood().elementAt(index).title=title;
                                                  HamburgerList.getFood().elementAt(index).description=description;
                                                  HamburgerList.getFood().elementAt(index).cost=cost;
                                                  /*HamburgerList.add(FoodRe(title,*//*image,*//*description,cost));*/
                                                });
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: Text("Update")),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            /*padding: EdgeInsets.all(10.0),*/
                            color: Colors.deepOrange,
                            textColor: Colors.white,
                            child: Text("details",
                                style: TextStyle(fontSize: 15)),
                          ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context,
            builder: (context)=>Container(
              padding: EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Title",
                        labelStyle: (TextStyle(color: Colors.deepOrange)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrange
                            )
                        ),
                      ),
                      onSaved: (String value){
                        title=value;
                      },
                      validator: (String value){
                        if(value.isEmpty || value==null){
                          return "Required";
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: InputDecoration(labelText: "Description",
                        labelStyle: (TextStyle(color: Colors.deepOrange)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrange
                            )
                        ),
                      ),
                      onSaved: (String value){
                        description=value;
                      },
                      validator: (String value){
                        if(value.isEmpty || value==null){
                          return "Required";
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Cost",
                        labelStyle: (TextStyle(color: Colors.deepOrange)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrange
                            )
                        ),
                      ),
                      onSaved: (String value){
                        cost=value;
                      },
                      validator: (String value){
                        if(value.isEmpty || value==null){
                          return "Required";
                        }
                      },
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                        ),
                        onPressed: (){
                          bool ChecK=true;
                          if(_formKey.currentState.validate()){
                            setState(() {
                              _formKey.currentState.save();
                              for(int i=0;i<HamburgerList.getFood().length;i++){
                                if(HamburgerList.getFood().elementAt(i).title==title);
                                {
                                  HamburgerList.getFood().elementAt(i).title=title;
                                  HamburgerList.getFood().elementAt(i).description=description;
                                  HamburgerList.getFood().elementAt(i).cost=cost;
                                  ChecK=false;

                                }
                              }
                              if(ChecK) {
                                HamburgerList.add(
                                    FoodRe(title, /*image,*/description, cost));
                              }
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: Text("ADD")),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class Pizza extends StatefulWidget {
  static List<FoodRe> list;
  Pizza(List<FoodRe> list){
    list=list;
  }
  @override
  _PizzaState createState() => _PizzaState();
}
class _PizzaState extends State<Pizza > {
  bool pressGeoON = false;
  bool cmbscritta = false;
  var _formKey=GlobalKey<FormState>();
  String title;
  Image image=Image.asset("assets/images/NoPhoto.png");
  String description;
  String cost;
  @override
  Widget build(BuildContext context) {
    String tap1="Available";
    String tap2="Unavailable";
    return Scaffold(
      body:Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child:Container(
          child: ListView(
            children: List.generate(
              PizzaList.getFood().length,
                  (index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: ListTile(
                    leading:Image.asset(PizzaList.getFood().elementAt(index).image),
                    title:Text(PizzaList.getFood().elementAt(index).getTitle()),
                    subtitle:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(PizzaList.getFood().elementAt(index).getDescription()),
                          RichText(
                            text:TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: "Cost:",style: TextStyle(color: Colors.black87),),
                                TextSpan(text: PizzaList.getFood().elementAt(index).getCost(),style: TextStyle(color: Colors.black54)),
                                TextSpan(text: " Toman",style: TextStyle(color: Colors.black87),),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: cmbscritta ? tap1 : tap2,
                              style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 15),
                              recognizer: new TapGestureRecognizer()..onTap = () => setState(() {
                                pressGeoON = !pressGeoON;
                                cmbscritta = !cmbscritta;
                              }),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Delete",
                              style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,fontSize: 15),
                              recognizer: new TapGestureRecognizer()..onTap = () => setState(() {
                                PizzaList.getFood().removeAt(index);
                              }),
                            ),
                          ),
                        ]
                    ),
                    trailing: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.deepOrange)),
                      onPressed: () {
                        showModalBottomSheet(context: context,
                          builder: (context)=>Container(
                            padding: EdgeInsets.all(15),
                            child: Form(
                              key: _formKey,
                              child: ListView(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(labelText: "Title",
                                      labelStyle: (TextStyle(color: Colors.deepOrange)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepOrange
                                          )
                                      ),
                                    ),
                                    onSaved: (String value){
                                      title=value;
                                    },
                                    /*validator: (String value){
                                            if(value.isEmpty || value==null){
                                              title=HamburgerList.getFood().elementAt(index-1).title;
                                            }
                                          },*/
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 4,
                                    decoration: InputDecoration(labelText: "Description",
                                      labelStyle: (TextStyle(color: Colors.deepOrange)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepOrange
                                          )
                                      ),
                                    ),
                                    onSaved: (String value){
                                      description=value;
                                    },
                                    /*validator: (String value){
                                            if(value.isEmpty || value==null){

                                              *//*return "Required";*//*
                                            }
                                          },*/
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(labelText: "Cost",
                                      labelStyle: (TextStyle(color: Colors.deepOrange)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepOrange
                                          )
                                      ),
                                    ),
                                    onSaved: (String value){
                                      cost=value;
                                    },
                                    /*validator: (String value){
                                            if(value.isEmpty || value==null){
                                              return "Required";
                                            }
                                          },*/
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepOrange,
                                      ),
                                      onPressed: (){

                                        if(_formKey.currentState.validate()){
                                          setState(() {
                                            _formKey.currentState.save();
                                            if(title==""){
                                              title=PizzaList.getFood().elementAt(index).title;
                                            }
                                            if(description==""){
                                              description=PizzaList.getFood().elementAt(index).description;
                                            }
                                            if(cost==""){
                                              cost=PizzaList.getFood().elementAt(index).cost;
                                            }
                                            PizzaList.getFood().elementAt(index).title=title;
                                            PizzaList.getFood().elementAt(index).description=description;
                                            PizzaList.getFood().elementAt(index).cost=cost;
                                            /*HamburgerList.add(FoodRe(title,*//*image,*//*description,cost));*/
                                          });
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text("Update")),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      /*padding: EdgeInsets.all(10.0),*/
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                      child: Text("details",
                          style: TextStyle(fontSize: 15)),
                    ),

                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context,
            builder: (context)=>Container(
              padding: EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Title",
                        labelStyle: (TextStyle(color: Colors.deepOrange)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrange
                            )
                        ),
                      ),
                      onSaved: (String value){
                        title=value;
                      },
                      validator: (String value){
                        if(value.isEmpty || value==null){
                          return "Required";
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: InputDecoration(labelText: "Description",
                        labelStyle: (TextStyle(color: Colors.deepOrange)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrange
                            )
                        ),
                      ),
                      onSaved: (String value){
                        description=value;
                      },
                      validator: (String value){
                        if(value.isEmpty || value==null){
                          return "Required";
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Cost",
                        labelStyle: (TextStyle(color: Colors.deepOrange)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrange
                            )
                        ),
                      ),
                      onSaved: (String value){
                        cost=value;
                      },
                      validator: (String value){
                        if(value.isEmpty || value==null){
                          return "Required";
                        }
                      },
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                        ),
                        onPressed: (){
                          bool ChecK=true;
                          if(_formKey.currentState.validate()){
                            setState(() {
                              _formKey.currentState.save();
                              for(int i=0;i<PizzaList.getFood().length;i++){
                                if(PizzaList.getFood().elementAt(i).title==title);
                                {
                                  PizzaList.getFood().elementAt(i).title=title;
                                  PizzaList.getFood().elementAt(i).description=description;
                                  PizzaList.getFood().elementAt(i).cost=cost;
                                  ChecK=false;

                                }
                              }
                              if(ChecK) {
                                PizzaList.add(
                                    FoodRe(title, /*image,*/description, cost));
                              }
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: Text("ADD")),
                    /*ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                        ),
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            setState(() {
                              _formKey.currentState.save();
                              PizzaList.add(FoodRe(title,*//*image,*//*description,cost));
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: Text("ADD")),*/

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class Drinks extends StatefulWidget {
  static List<FoodRe> list;
  Drinks(List<FoodRe> list){
    list=list;
  }
  @override
  _DrinksState createState() => _DrinksState();
}
class _DrinksState extends State<Drinks > {
  bool pressGeoON = false;
  bool cmbscritta = false;
  var _formKey=GlobalKey<FormState>();
  String title;
  Image image=Image.asset("assets/images/NoPhoto.png");
  String description;
  String cost;
  @override
  Widget build(BuildContext context) {
    String tap1="Available";
    String tap2="Unavailable";
    return Scaffold(
      body:Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child:Container(
          child: ListView(
            children: List.generate(
              DrinksList.getFood().length,
                  (index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: ListTile(
                    leading:Image.asset(DrinksList.getFood().elementAt(index).image),
                    title:Text(DrinksList.getFood().elementAt(index).getTitle()),
                    subtitle:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(DrinksList.getFood().elementAt(index).getDescription()),
                          RichText(
                            text:TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: "Cost:",style: TextStyle(color: Colors.black87),),
                                TextSpan(text: DrinksList.getFood().elementAt(index).getCost(),style: TextStyle(color: Colors.black54)),
                                TextSpan(text: " Toman",style: TextStyle(color: Colors.black87),),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: cmbscritta ? tap1 : tap2,
                              style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 15),
                              recognizer: new TapGestureRecognizer()..onTap = () => setState(() {
                                pressGeoON = !pressGeoON;
                                cmbscritta = !cmbscritta;
                              }),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Delete",
                              style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,fontSize: 15),
                              recognizer: new TapGestureRecognizer()..onTap = () => setState(() {
                                DrinksList.getFood().removeAt(index);
                              }),
                            ),
                          ),
                        ]
                    ),
                    trailing: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.deepOrange)),
                      onPressed: () {
                        showModalBottomSheet(context: context,
                          builder: (context)=>Container(
                            padding: EdgeInsets.all(15),
                            child: Form(
                              key: _formKey,
                              child: ListView(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(labelText: "Title",
                                      labelStyle: (TextStyle(color: Colors.deepOrange)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepOrange
                                          )
                                      ),
                                    ),
                                    onSaved: (String value){
                                      title=value;
                                    },
                                    /*validator: (String value){
                                            if(value.isEmpty || value==null){
                                              title=HamburgerList.getFood().elementAt(index-1).title;
                                            }
                                          },*/
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 4,
                                    decoration: InputDecoration(labelText: "Description",
                                      labelStyle: (TextStyle(color: Colors.deepOrange)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepOrange
                                          )
                                      ),
                                    ),
                                    onSaved: (String value){
                                      description=value;
                                    },
                                    /*validator: (String value){
                                            if(value.isEmpty || value==null){

                                              *//*return "Required";*//*
                                            }
                                          },*/
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(labelText: "Cost",
                                      labelStyle: (TextStyle(color: Colors.deepOrange)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepOrange
                                          )
                                      ),
                                    ),
                                    onSaved: (String value){
                                      cost=value;
                                    },
                                    /*validator: (String value){
                                            if(value.isEmpty || value==null){
                                              return "Required";
                                            }
                                          },*/
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepOrange,
                                      ),
                                      onPressed: (){

                                        if(_formKey.currentState.validate()){
                                          setState(() {
                                            _formKey.currentState.save();
                                            if(title==""){
                                              title=DrinksList.getFood().elementAt(index).title;
                                            }
                                            if(description==""){
                                              description=DrinksList.getFood().elementAt(index).description;
                                            }
                                            if(cost==""){
                                              cost=DrinksList.getFood().elementAt(index).cost;
                                            }
                                            DrinksList.getFood().elementAt(index).title=title;
                                            DrinksList.getFood().elementAt(index).description=description;
                                            DrinksList.getFood().elementAt(index).cost=cost;
                                            /*HamburgerList.add(FoodRe(title,*//*image,*//*description,cost));*/
                                          });
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text("Update")),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      /*padding: EdgeInsets.all(10.0),*/
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                      child: Text("details",
                          style: TextStyle(fontSize: 15)),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context,
            builder: (context)=>Container(
              padding: EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Title",
                        labelStyle: (TextStyle(color: Colors.deepOrange)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrange
                            )
                        ),
                      ),
                      onSaved: (String value){
                        title=value;
                      },
                      validator: (String value){
                        if(value.isEmpty || value==null){
                          return "Required";
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: InputDecoration(labelText: "Description",
                        labelStyle: (TextStyle(color: Colors.deepOrange)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrange
                            )
                        ),
                      ),
                      onSaved: (String value){
                        description=value;
                      },
                      validator: (String value){
                        if(value.isEmpty || value==null){
                          return "Required";
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Cost",
                        labelStyle: (TextStyle(color: Colors.deepOrange)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepOrange
                            )
                        ),
                      ),
                      onSaved: (String value){
                        cost=value;
                      },
                      validator: (String value){
                        if(value.isEmpty || value==null){
                          return "Required";
                        }
                      },
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                        ),
                        onPressed: (){
                          bool ChecK=true;
                          if(_formKey.currentState.validate()){
                            setState(() {
                              _formKey.currentState.save();
                              for(int i=0;i<DrinksList.getFood().length;i++){
                                if(DrinksList.getFood().elementAt(i).title==title);
                                {
                                  DrinksList.getFood().elementAt(i).title=title;
                                  DrinksList.getFood().elementAt(i).description=description;
                                  DrinksList.getFood().elementAt(i).cost=cost;
                                  ChecK=false;

                                }
                              }
                              if(ChecK) {
                                DrinksList.add(
                                    FoodRe(title, /*image,*/description, cost));
                              }
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: Text("ADD")),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class All extends StatefulWidget {
  static List<FoodRe> list;
  All(List<FoodRe> list){
    list=list;
  }
  @override
  _AllState createState() => _AllState();
}
class _AllState extends State<All > {
  List<FoodRe> list=All.list;
  bool pressGeoON = false;
  bool cmbscritta = false;
  var _formKey=GlobalKey<FormState>();
  String title;
  Image image=Image.asset("assets/images/NoPhoto.png");
  String description;
  String cost;
  @override
  Widget build(BuildContext context) {
   if(PizzaList.pizzas.isNotEmpty && DrinksList.foods.isNotEmpty && HamburgerList.hamburgers.isNotEmpty) {
     list.addAll(PizzaList.getFood());
     list.addAll(DrinksList.getFood());
     list.addAll(HamburgerList.getFood());
     String tap1 = "Available";
     String tap2 = "Unavailable";
     return Scaffold(
       body: Card(
         elevation: 8.0,
         margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
         child: Container(
           child: ListView(
             children: List.generate(
               list.length,
                   (index) {
                 return Container(
                   margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.deepOrange,
                       width: 1,
                     ),
                     borderRadius: BorderRadius.circular(13),
                   ),
                   child: ListTile(
                     leading: Image.asset(list
                         .elementAt(index)
                         .image),
                     title: Text(list.elementAt(index).getTitle()),
                     subtitle: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(list.elementAt(index).getDescription()),
                           RichText(
                             text: TextSpan(
                               children: <TextSpan>[
                                 TextSpan(text: "Cost:",
                                   style: TextStyle(color: Colors.black87),),
                                 TextSpan(text: list.elementAt(index).getCost(),
                                     style: TextStyle(color: Colors.black54)),
                                 TextSpan(text: " Toman",
                                   style: TextStyle(color: Colors.black87),),
                               ],
                             ),
                           ),
                           RichText(
                             text: TextSpan(
                               text: cmbscritta ? tap1 : tap2,
                               style: TextStyle(color: Colors.deepOrange,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 15),
                               recognizer: new TapGestureRecognizer()
                                 ..onTap = () =>
                                     setState(() {
                                       pressGeoON = !pressGeoON;
                                       cmbscritta = !cmbscritta;
                                     }),
                             ),
                           ),
                           RichText(
                             text: TextSpan(
                               text: "Delete",
                               style: TextStyle(color: Colors.deepOrangeAccent,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 15),
                               recognizer: new TapGestureRecognizer()
                                 ..onTap = () =>
                                     setState(() {
                                       list.removeAt(index);
                                     }),
                             ),
                           ),
                         ]
                     ),
                     trailing: Expanded(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           RaisedButton(
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(18.0),
                                 side: BorderSide(color: Colors.deepOrange)),
                             onPressed: () {},
                             /*padding: EdgeInsets.all(10.0),*/
                             color: Colors.deepOrange,
                             textColor: Colors.white,
                             child: Text("details",
                                 style: TextStyle(fontSize: 15)),
                           ),
                         ],
                       ),
                     ),
                   ),
                 );
               },
             ),
           ),
         ),
       ),

     );
   }
   else{
     return Scaffold(
       body: Card(
         elevation: 8.0,
         margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
         child: Container(
         ),
       ),

     );
   }
  }
}


