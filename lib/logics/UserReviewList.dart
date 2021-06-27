import 'package:snappfood/logics/UserReviews.dart';

class UserReviewList{
  static  List<UserReviews> _userReviews=List.empty(growable: true);
  static void add(UserReviews userReview){
    bool check=true;
    for(int i=0;i<_userReviews.length;i++){
      if(userReview.name==_userReviews.elementAt(i).name && _userReviews.elementAt(i).comment==userReview.comment){
        _userReviews.elementAt(i).answer=userReview.answer;
        check=false;
      }
    }
    if(check){
      _userReviews.add(userReview);
    }
  }
  static List<UserReviews> getUserReviews(){
    return _userReviews;
  }
  static addAnswer(String name,String comment,String answer){
    for(int i=0;i<_userReviews.length;i++){
      if(_userReviews.elementAt(i).name==name && _userReviews.elementAt(i).comment==comment){
        _userReviews.elementAt(i).answer=answer;
      }
    }
  }
}