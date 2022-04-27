import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyofscience/presentation/OnBoarding/View/onBoearingScreen.dart';
import 'package:keyofscience/presentation/main/HomeZommDrawer.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  /// this is used to remove the color of the status bar of the phone
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
      theme: getThemeData(),
      debugShowCheckedModeBanner: false,
      home: const onBoardingScreen(),
    );
  }
}

