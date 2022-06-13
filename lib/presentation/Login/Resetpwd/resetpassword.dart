import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../resources/ColorManager.dart';
import '../../resources/FontsManager.dart';
import '../../resources/Styles_Manager.dart';
import '../../resources/values_manager.dart';
import '../ViewModel/login_viewModel.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

final _emailcontroller = TextEditingController();
// @override
//   void dispose() {
//     _emailcontroller.dispose();
//     super.dispose();
//   }
  Future passwordReset() async{
   try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailcontroller.text.trim());
      showDialog(context: context, 
    builder: (context){
      return AlertDialog(
        content: Text("Password reset link sent! Check your Email", style: TextStyle(color: Colors.black),),
      );
    }
    );
   } on FirebaseAuthException catch(e){
    print(e);
    showDialog(context: context, 
    builder: (context){
      return AlertDialog(
        content: Text(e.message.toString(), style: TextStyle(color: Colors.black),),
      );
    }
    );
   }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100.0,),
            Text('Reset Password' , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold , fontSize: 30),),
            Padding(
              padding: const EdgeInsets.only(top: 10.0 , left: 7.0),
              child: Text("Enter your Email and we will send you a password reset link", style: TextStyle(color: Colors.black), textAlign:TextAlign.center,),
            ),
            SizedBox(
              height: 100.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: AppPadding.p30),
              child: TextFormField(
                style: const TextStyle(color: ColorManager.black),
                controller: _emailcontroller,
                cursorColor: ColorManager.defaultColor,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical:14 ),
                  filled: true,
                  fillColor: Color(0xFFEFF2FE),
                  hintText: " E-mail ID",
                  hintStyle: TextStyle(color: Colors.grey , fontSize: 12 , fontWeight: FontWeight.w600),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),
                ),
              ),
            ),
            SizedBox(height: 50.0,),
            SizedBox(
                width: 370.0,
                child: Selector<loginUser_viewModel , bool>(
                  selector: (_,provider)=>provider.isLoading,
                  builder: (_,isLoading,__)=> isLoading? const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.defaultColor,
                    ),
                  ) :
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                                elevation: AppElevation.e5,
                                padding: const EdgeInsets.all(AppPadding.p15),
                                shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppMargin.m10)),
                                primary: ColorManager.defaultColor,
                                // ColorManager.defaultColor
                              ),
                    onPressed:passwordReset,
                    child: Text(
                      'send link',
                      style: semiBoldStyle(color: ColorManager.white , fontSize: FontSizeManager.s15),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
    
  }
}