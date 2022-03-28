import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyofscience/pages/HomeZommDrawer.dart';
import 'package:keyofscience/pages/MainScreen.dart';
import 'package:keyofscience/pages/signin.dart';
import 'kdefault.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Kdefault.KdefaultColor,
        primarySwatch: Colors.grey,
      ),
      home: const RegisterPage(),
    );
  }
}




class testscreen extends StatelessWidget {
  const testscreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [

        ],
      ),
    );
  }
}
