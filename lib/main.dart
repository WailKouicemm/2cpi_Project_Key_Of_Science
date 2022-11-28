import 'package:flutter/material.dart';
import 'package:keyofscience/pages/Checkmail/checkmail.dart';
import 'package:keyofscience/pages/login.dart';
import 'package:keyofscience/pages/signin.dart';
import 'kdefault.dart';
//import 'components.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: KdefaultColor,
        primarySwatch: Colors.grey,
      ),
      home: const CheckMail()
    );
  }
}


