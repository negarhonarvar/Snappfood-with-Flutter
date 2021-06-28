import 'package:flutter/material.dart';
import 'package:snappfood/logics/UserReviews.dart';
import 'package:snappfood/logics/UserReviewList.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  String username="sara";
  String comment="Hi there,it takes a long time until I took the food.";
  String answer="Not Answered";
  var _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    UserReviewList.add(UserReviews(username,comment,answer));
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
      body:Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child:Container(
          child: ListView(
            children: List.generate(
              UserReviewList.getUserReviews().length,
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
                    title:Text(UserReviewList.getUserReviews().elementAt(index).name+" :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                    subtitle:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(UserReviewList.getUserReviews().elementAt(index).comment,style: TextStyle(color: Colors.black,fontSize: 16),),
                          Text("Admin : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                          Text(answer,style: TextStyle(color: Colors.black,fontSize: 16),),
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
                                    decoration: InputDecoration(labelText: "answer",
                                      labelStyle: (TextStyle(color: Colors.deepOrange)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepOrange
                                          )
                                      ),
                                    ),
                                    onSaved: (String value){
                                      answer=value;
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
                                        if(_formKey.currentState.validate()){
                                          setState(() {
                                            _formKey.currentState.save();
                                            UserReviewList.getUserReviews().elementAt(index).answer=answer;
                                          });
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text("answer")),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                      child: Text("Answer",
                          style: TextStyle(fontSize: 15)),
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
}
