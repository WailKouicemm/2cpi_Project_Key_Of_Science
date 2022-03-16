import 'package:flutter/material.dart';
import 'package:keyofscience/components.dart';
import 'package:keyofscience/kdefault.dart';
import 'package:keyofscience/pages/preferredcourses.dart';
import 'package:keyofscience/pages/signin.dart';

class Login extends StatefulWidget {
  const Login();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return Scaffold(
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
                    color: KdefaultColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat"),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/backround.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: height * 0.52,
                width: widh,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 8,
                      blurRadius: 14,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: KdefaultColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 40,bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormFiledC(
                        icon: const Icon(Icons.email, color: KdefaultColor),
                        text: 'E-mail',
                      ),
                      TextFormFiledC(
                        icon: const Icon(Icons.password, color: KdefaultColor),
                        text: 'Password',
                        padding: 15,
                      ),
                      Wrap(
                        children: [
                          const Text(
                            "don't remmember password ?",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: "Montserrat"),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(' rest here ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    fontFamily: "Montserrat")),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LoginButton(
                        text: 'LOG IN',
                        onpressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PreferredCourses()),
                          );
                        },
                        backgroundCOlor: Colors.white,
                        textColor: KdefaultColor,
                      ),
                      const   SizedBox(
                        height: 20,
                      ),
                      const Spacer(),
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
            )
          ],
        ),
      ),
    );
  }
}
