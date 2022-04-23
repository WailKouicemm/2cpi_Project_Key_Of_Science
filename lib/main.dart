import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyofscience/pages/RegisterPage.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';

import 'onBoearingScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  /// this is used to remove the color of the status bar of the phone
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: getThemeData(),
    home: const RegisterPage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  getThemeData(),
      home: const onBoardingScreen(),
    );
  }
}

