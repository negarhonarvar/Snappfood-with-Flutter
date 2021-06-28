import 'package:flutter/cupertino.dart';
import 'package:snappfood/Model/User.dart';


class Users {
  List<User> users=List.empty(growable: true);

  void addUser(String name,String pass){
    users.add(new User(name,pass));
  }
  bool findUsers(String name,String pass){
    for(int i=0;i<users.length;i++){
      if(users.elementAt(i).getUsername()==name && users.elementAt(i).getPass()==pass){
        return true;
      }
    }
    return false;
  }
}
