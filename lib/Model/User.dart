class User{
  String _username;
  String _pass;
  User(String username,String pass){
    this._username=username;
    this._pass=pass;
  }
  void setUsername(String username){
    this._username=username;
  }
  void setPass(String pass) {
    this._pass=pass;
  }
  String getUsername(){
    return _username;
  }
  String getPass(){
    return _pass;
  }
}
