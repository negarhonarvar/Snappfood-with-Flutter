import 'package:snappfood/logics/FoodRe.dart';

class PizzaList{
  static List<FoodRe> pizzas=List.empty(growable: true);
  static void add(FoodRe pizza){
    pizzas.add(pizza);
  }
  static void remove(FoodRe pizza){
    pizzas.remove(pizza);
  }
  static List<FoodRe> getFood(){
    return pizzas;
  }
}
