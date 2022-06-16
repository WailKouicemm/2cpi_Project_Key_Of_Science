

import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/WelcomScreen/WelcomScreen.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';

import '../resources/ColorManager.dart';

import '../resources/App.dart';
import '../resources/FontsManager.dart';



class EmailSucc extends StatelessWidget {
  const EmailSucc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        centerTitle: false,
        backgroundColor: Colors.white,
        title:  Text(app.appName , style: TextStyle(color: ColorManager.defaultColor),),
      ),

      body: Padding(
        padding: const EdgeInsets.only(right: AppPadding.p30 , left: AppPadding.p30 , top: AppPadding.p50 ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/EmailVerify.png' ,width: size.width * 0.7,),

              Text("Your account was successfully " , style : TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontFamily: FontFamilyManager.defaultFamily , fontSize: 20 ),
              ),
              Text("created"  , style : TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontFamily: FontFamilyManager.defaultFamily , fontSize: 20 ),
              ),
              SizedBox(height: 10,),
              Text("You are welcom to TreeTech community,now you can start your membership and benefit from features of ours services" , style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w400),),

              SizedBox(height: 25,),
          SizedBox(
            width: size.width,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomScreen(),
                  ),
                );

              },
              child: const Text(
                "START"
              ),
            ),
          ),


        ],
          ),
        ),
      ),
    );
  }
}
