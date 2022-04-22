import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/components.dart';
import 'package:keyofscience/kdefault.dart';
import 'package:keyofscience/pages/login.dart';
import 'package:keyofscience/pages/preferredcourses.dart';

import '../presentation/resources/values_manager.dart';



class RegisterPage extends StatelessWidget {
  const RegisterPage();
  
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Kdefault.KbackgroundColor,
      appBar: Appbar.appbar,
      body: ListView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.only(
                  // top: height * 0.07 ,
                  // right: width * 0.28 ,
                  // bottom: height * 0.02 ,
                  top: AppPadding.p20,
                  right: width * 0.28,
                  bottom: AppPadding.p10,
                  left: AppPadding.p10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Firstly, let's get your " ,
                            style: Theme.of(context).textTheme.headline1
                              /*
                              TextStyle(color: Colors.black ,
                                fontSize: 30 ,
                                fontWeight: FontWeight.bold,fontFamily: "Montserrat"),
                               */
                          ),
                          const TextSpan(
                            text: "details" ,
                            style: TextStyle(color: Colors.white ,
                                backgroundColor: Kdefault.KdefaultColor ,
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
                    child: Text(
                      "add your e-mail adresss and password to create your account" ,
                      style: Theme.of(context).textTheme.caption,
                      // style: TextStyle(
                      //     color: Colors.grey ,
                      //     fontFamily: "Montserrat"
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: const  EdgeInsets.symmetric(horizontal: 20) ,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormFiledC(
                    text: " Full name",
                    icon: const  Icon(null),
                  ),
                  TextFormFiledC(
                    text: ' E-mail',
                    icon: const  Icon(null),
                    textInputType: TextInputType.emailAddress,
                  ),
                  TextFormFiledC(
                    suffixicon: true,
                    obscured: true,
                    text: ' Password',
                    icon: const  Icon(null),
                  ),
                  TextFormFiledC(
                    suffixicon: true
                    ,obscured: true,
                    text: ' Confirm Password',
                    icon: const  Icon(null),
                    padding: 20
                    ,),
                  /// privacy text
                  Row(
                    children: [
                      const  Icon(Icons.check_box , color: Kdefault.KdefaultColor,size: 15,),
                      Text(
                        '  I confirmed i have read the',
                        style: Theme.of(context).textTheme.caption,
                        //  style: TextStyle(color: Colors.black87 , fontSize: 12,fontFamily: "Montserrat"),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: (){},
                          child: const AutoSizeText(
                            'privacy Acknowledgent ',
                            maxLines: 1,
                            minFontSize: 5,
                            maxFontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const  SizedBox(height: 20,),
                  SizedBox(
                    width: width,
                    child: ElevatedButton(
                      onPressed: (){
                        _formKey.currentState!.validate();
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  const  PreferredCourses()),
                        );
                      },
                      child: const Text(
                          "SIGN UP",
                      ),
                    ),
                  ),
                  // LoginButton(text: 'SIGN UP', onpressed: (){
                  //   Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>  const  PreferredCourses()),
                  //   );
                  // },),
                  SizedBox(height: height * 0.065,),

                ],
              ),
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
                 Text("Already have account" ,
                 style: Theme.of(context).textTheme.headline2,
                 // style: TextStyle(color: Kdefault.KdefaultColor , fontFamily: "Montserrat"),
                ),


                TextButton(
                  onPressed: ()=> Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) =>  const   Login(),
                    ),
                  ),
                  child: const  Text(
                      '? LOGIN ',
                    //  style: TextStyle(color: Kdefault.KdefaultColor , fontWeight: FontWeight.bold , fontSize: 12 , fontFamily: "Montserrat")
                  ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


