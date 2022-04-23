import 'package:flutter/material.dart';
import 'package:keyofscience/components.dart';
import 'package:keyofscience/kdefault.dart';
import 'package:keyofscience/pages/HomeZommDrawer.dart';
import 'package:keyofscience/pages/RegisterPage.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';

import '../presentation/resources/Styles_Manager.dart';
import '../presentation/resources/values_manager.dart';



class Login extends StatefulWidget {
  const Login();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getThemeData().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: AppElevation.e5,
              padding: const EdgeInsets.all(AppPadding.p12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppMargin.m10)),
              primary: ColorManager.white,
              // ColorManager.defaultColor
            )
        ),
      ),
      home: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: height * 0.5,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "KEYEINCE",
                  style: TextStyle(
                      color: Kdefault.KdefaultColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat"),
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/backround_appbar.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: height * 0.52,
                  width: widh,
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 8,
                        blurRadius: 14,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Kdefault.KdefaultColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormFiledC(
                            icon: const Icon(Icons.email, color: Kdefault.KdefaultColor),
                            text: 'E-mail',
                          ),
                          TextFormFiledC(
                            icon: const Icon(Icons.password, color: Kdefault.KdefaultColor),
                            text: 'Password',
                            padding: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                "don't remmember password ?",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: "Montserrat"),
                              ),
                              TextButton(
                                onPressed: (){},
                                child: const Text(' rest here ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      fontFamily: "Montserrat"),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: widh,
                            child: ElevatedButton(
                              onPressed: (){
                                _formKey.currentState!.validate();
                                Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => const HommePage()),
                                );
                              },
                              child: Text(
                                'LOG IN',
                                style: semiBoldStyle(color: ColorManager.defaultColor),
                              ),
                            ),
                          ),
                          // LoginButton(
                          //   text: 'LOG IN',
                          //   onpressed: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const PreferredCourses()),
                          //     );
                          //   },
                          //   backgroundCOlor: Colors.white,
                          //   textColor: Kdefault.KdefaultColor,
                          // ),

                          const   SizedBox(
                            height: 20,
                          ),
                          //  const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const   Text(
                                "don't have account ?",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: "Montserrat"),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  const  RegisterPage()),
                                  );
                                },
                                child: const   Text(' register now ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        fontFamily: "Montserrat")),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
