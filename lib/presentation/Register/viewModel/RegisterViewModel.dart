

import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/Register/view/RegisterPage.dart';
import 'package:keyofscience/presentation/resources/appStrings.dart';
import 'package:keyofscience/services/Authenctication.dart';

import '../../../Widgets/AwesomeMessag.dart';


class RegisterUser extends ChangeNotifier{
   RegisterUser();
  bool isLoading = false;
  Future<void> registerUser(
      {required String email,required String password,
        required String Username, required BuildContext context})async{
    isLoading = true;
    notifyListeners();

   try{
     await  AuthService.SignUpWithEmailPasssword(email, password);
     AuthService.setUsername(Username);
   } on FirebaseAuthException catch (error){
     isLoading = false;
     notifyListeners();
     String message = AppStrings.unknownError;
     if (error.toString().contains("auth/email-already-in-use") ) {
       message = AppStrings.emailUsedBefore ;
     }
     else if (error.toString().contains("auth/invalid-email")) {
       message = AppStrings.invalidEmail ;
     }
     else if (error.toString().contains("auth/operation-not-allowed")) {
       message = AppStrings.operationNotAllowed ;
     }
     else if (error.toString().contains( "auth/weak-password")) {
       message = AppStrings.operationNotAllowed ;
     }

     AwesomeMessag(context: context, title: AppStrings.errorTitle, message: message);
   } catch (e){
     AwesomeMessag(context: context, title: AppStrings.errorTitle, message:  AppStrings.unknownError);
   }

  }
}