import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/theme/components.dart';
import 'package:keyofscience/theme/kdefault.dart';

import 'package:flutter_svg/svg.dart';

import 'package:keyofscience/pages/login.dart';
import 'package:keyofscience/pages/preferredcourses.dart';

import 'Grey_text.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage();
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: KbackgroundColor,
      appBar: Appbar.appbar,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.07 , right: width * 0.28 , bottom: height * 0.02 , left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text:  const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Firstly, let's get your " ,
                            style: TextStyle(color: Colors.black , fontSize: 30 , fontWeight: FontWeight.bold,fontFamily: "Montserrat"),
                          ),
                          TextSpan(
                            text: "details" ,
                            style: TextStyle(color: Colors.white ,
                                backgroundColor: KdefaultColor ,
                                fontSize: 30 ,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat"
                            ),
                          )
                        ]
                    ),
                  ),
                  const  SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    width: width * 0.5 ,
                    child: const  Text(
                      "add your e-mail adresss and password to create your account" ,
                      style: TextStyle(
                          color: Colors.grey ,
                          fontFamily: "Montserrat"
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: const  EdgeInsets.symmetric(horizontal: 20) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormFiledC(text: " Full name",icon: const  Icon(null)),
                TextFormFiledC(text: ' E-mail', icon: const  Icon(null),textInputType: TextInputType.emailAddress,),
                TextFormFiledC(suffixicon: true,obscured: true,text: ' Password',icon: const  Icon(null)),
                TextFormFiledC(suffixicon: true,obscured: true,text: ' Confirm Password',icon: const  Icon(null) , padding: 20,),
                /// privacy text
                Row(
                  children: [
                    const  Icon(Icons.check_box , color: KdefaultColor,size: 15,),
                    const Text(
                        '  I confirmed i have read the',
                        style: TextStyle(color: Colors.black87 , fontSize: 12,fontFamily: "Montserrat")
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: (){},
                        child:  const AutoSizeText(
                            'privacy Acknowledgent ',
                            maxLines: 1,
                            minFontSize: 5,
                            maxFontSize: 25,
                            style: TextStyle(color: KdefaultColor, fontWeight: FontWeight.bold , fontSize: 12,fontFamily: "Montserrat")
                        ),
                      ),
                    ),
                  ],
                ),
                const  SizedBox(height: 20,),
                LoginButton(text: 'SIGN UP', onpressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  const  PreferredCourses()),
                  );
                },),
                SizedBox(height: height * 0.065,),

              ],

            ),
          ),
          Container(
            decoration:  const  BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],

                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30) , topRight: Radius.circular(30))
            ),
            width:double.infinity,
            alignment: Alignment.center,
            height: height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have account" , style: TextStyle(color: KdefaultColor , fontFamily: "Montserrat"),),


                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const   Login()),);
                  },
                  child: const  Text(
                      '? LOGIN ',
                      style: TextStyle(color: KdefaultColor , fontWeight: FontWeight.bold , fontSize: 12 , fontFamily: "Montserrat")
                  ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


