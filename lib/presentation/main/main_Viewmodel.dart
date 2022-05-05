import 'package:flutter/material.dart';
import 'package:keyofscience/services/Authenctication.dart';

class usernameManage extends ChangeNotifier {
String username = "username";

  Future<void> fetchUsername()async{
  username= await AuthService.fetchUsername();
  notifyListeners();
}



}