import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyofscience/pages/signin.dart';
import 'package:keyofscience/theme/kdefault.dart';



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
        primaryColor: KdefaultColor,
        primarySwatch: Colors.grey,
      ),
      home: const RegisterPage(),
    );
  }
}


