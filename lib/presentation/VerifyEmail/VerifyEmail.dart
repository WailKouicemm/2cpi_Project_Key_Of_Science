import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/main/main_view.dart';

import '../OnBoarding/View/onBoearingScreen.dart';





 class VerifyEmail extends StatefulWidget {
   const VerifyEmail({Key? key}) : super(key: key);

   @override
   State<VerifyEmail> createState() => _VerifyEmailState();
 }

 class _VerifyEmailState extends State<VerifyEmail> {
   bool isEmailverified = false ;
   Timer? timer ;
   @override
   void initState() {
    super.initState();
    isEmailverified = FirebaseAuth.instance.currentUser!.emailVerified ;
    if(!isEmailverified){
      sendVerificationEmail();
      timer = Timer.periodic(
      Duration(seconds:  3) ,
        (timer) {
          checkEmailVerefication();
        });
    }
  }
  @override
  void dispose(){
     timer?.cancel();
     super.dispose();
  }
   Future checkEmailVerefication()async{
     await FirebaseAuth.instance.currentUser!.reload() ;
    setState(() {
      isEmailverified= FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailverified){
      timer?.cancel();
    }
  }
   Future sendVerificationEmail()async{
     try{
     final user = FirebaseAuth.instance.currentUser!;
     await user.sendEmailVerification();}
         catch(e){
         }
   }
   @override
   Widget build(BuildContext context) => isEmailverified
       ? HomePage()
       : Scaffold(
            appBar: AppBar(
              title: Text("verify email"),
              centerTitle: true,
            ),

     body: Column(
       children: [
         MaterialButton(
           textColor: Colors.black,
             child: Text('sksd'),
             onPressed: sendVerificationEmail
         )
       ],
     ),
   );
 }
