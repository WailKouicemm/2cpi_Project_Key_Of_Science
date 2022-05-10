import 'package:flutter/material.dart';
import 'package:keyofscience/services/Authenctication.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
class usernameManage extends ChangeNotifier {
String username = "_";

  Future<void> fetchUsername()async{

    username = await AuthService.fetchUsername();
    print("usernameusername $username");
    if(username=="***"){
        final _firebaseAuth = auth.FirebaseAuth.instance;
      await AuthService.getUsernameFromFirebase(_firebaseAuth.currentUser!.email ?? "");
        username = await AuthService.fetchUsername();
    }
    print("finallyfinally $username");
    notifyListeners();

}
/*
  Future<void> fetchUsername()async{
    print("!isGetting ${!isGetting}");
    if(!isGetting){

    isGetting = true;
    print("entered  to  ===> fetchUsernamefetchUsername");
    username= await AuthService.fetchUsername();
    notifyListeners();
    print("finiched  to ===> fetchUsernamefetchUsername $username");
    isGetting = false;
  }
}
 */

}

class nextPage_viewModel extends ChangeNotifier {
  bool goToOnBoarding = false;

  void register(){
    goToOnBoarding = true;
  }

  void setFalse(){
    goToOnBoarding = true;
  }
}