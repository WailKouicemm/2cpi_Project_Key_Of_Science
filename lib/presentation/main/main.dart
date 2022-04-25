import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyofscience/pages/HomeZommDrawer.dart';
import 'package:keyofscience/presentation/Register/view/RegisterPage.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';

import '../OnBoarding/View/onBoearingScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  /// this is used to remove the color of the status bar of the phone
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MaterialApp(
    theme: getThemeData(),
    debugShowCheckedModeBanner: false,
    home: HommePage(),
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

