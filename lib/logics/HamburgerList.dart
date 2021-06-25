import 'package:snappfood/logics/FoodRe.dart';

class HamburgerList{
  static List<FoodRe> hamburgers=List.empty(growable: true);
  static void add(FoodRe foodRe){
    hamburgers.add(foodRe);
  }
  static void remove(FoodRe foodRe){
    hamburgers.remove(foodRe);
  }
  static List<FoodRe> getFood(){
    return hamburgers;
  }
}
