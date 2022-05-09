

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../Widgets/AwesomeMessag.dart';
import '../../../services/Authenctication.dart';
import '../../resources/appStrings.dart';

class loginUser_viewModel extends ChangeNotifier {

  bool isLoading = false;
  Future<void> loginUser({required String email,required String password,required BuildContext context})async{
    isLoading = true;
    notifyListeners();

    try {
      await AuthService.SignInWithEmailPasssword(email, password);

    } on FirebaseAuthException catch (error){
      isLoading = false;
      notifyListeners();
      print("loginUser FirebaseAuthException $error");

      String message = AppStrings.unknownError;
      if (error.toString().contains("user-not-found") ) {
        message = AppStrings.userNotFound ;
      }else if (error.toString().contains("wrong-password") ){
        message = AppStrings.wrongPassword;
      }else if(error.toString().contains("network-request-failed")){
        message = AppStrings.networdFailed;
      }
      AwesomeMessag(context: context, title: AppStrings.errorTitle, message: message);
    } catch (e){
      print("loginUser error $e");
      AwesomeMessag(context: context, title: AppStrings.errorTitle, message: AppStrings.unknownError);
    }
  }
}





