import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/appStrings.dart';
import 'package:keyofscience/services/Authenctication.dart';

import '../../../Widgets/AwesomeMessag.dart';


class RegisterUser_viewModel extends ChangeNotifier{
  bool isLoading = false;
  Future<void> registerUser(
      {required String email,required String password,
        required String username, required BuildContext context})async{
    isLoading = true;
    notifyListeners();

   try{
     await  AuthService.SignUpWithEmailPasssword(email, password,username);
   } on FirebaseAuthException catch (error){
     print(error);
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
     }else if(error.toString().contains("network-request-failed")){
       message = AppStrings.networdFailed;
     }

     AwesomeMessag(context: context, title: AppStrings.errorTitle, message: message);
   } catch (e){
     isLoading = false;
     notifyListeners();
     print(e);
     AwesomeMessag(context: context, title: AppStrings.errorTitle, message:  AppStrings.unknownError);
   }
  }
}