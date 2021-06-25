
import 'package:flutter/material.dart';


class FoodRe{
  String title;
  /*ImageProvider image=Image.asset("assets/NoPhoto.png").image;*/
  String image="assets/images/NoPhoto.png";
  String cost;
  String description;


  FoodRe(String title,/*Image image,*/String description,String cost){
    this.title=title;
    this.description=description;
    this.cost=cost;
    /*this.image=image;*/
  }

  String getTitle(){
    return title;
  }
  String getDescription() {
    return description;
  }
  String getImage(){
    return image;
  }
  String getCost(){
    return cost;
  }
}