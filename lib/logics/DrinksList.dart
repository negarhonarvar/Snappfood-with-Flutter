import 'package:snappfood/logics/FoodRe.dart';

class DrinksList{
  static List<FoodRe> foods=List.empty(growable: true);
  static void add(FoodRe drinksRe){
    foods.add(drinksRe);
  }
  static void remove(FoodRe drinksRe){
    foods.remove(drinksRe);
  }
  static List<FoodRe> getFood(){
    return foods;
  }
}
