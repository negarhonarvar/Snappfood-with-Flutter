import 'package:snappfood/logics/foodcat.dart';

class restuarant
{
  String name;
  String address;
  foodcat cat;
  int number;
  String password;
  restuarant(String name, String address, foodcat cat, int number , String password)
  {
    this.name=name;
    this.address=address;
    this.cat=cat;
    this.number=number;
    this.password=password;
  }

  String getname() {
    return name;
  }

  String getAddress() {
    return address;
  }

  foodcat getcat() {
    return cat;
  }

  int getnumber()
  {
    return number;
  }
  String getpassword()
  {
    return password;
  }
}
