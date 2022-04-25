import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyofscience/pages/HomeZommDrawer.dart';
import 'package:keyofscience/presentation/OnBoarding/View/onBoearingScreen.dart';
import 'package:keyofscience/presentation/OnBoarding/ViewModel/OnBoarding_ViewModel.dart';
import 'package:keyofscience/presentation/Register/view/RegisterPage.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';
import 'package:provider/provider.dart';


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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<pageIndexProvider>(create: (_) => pageIndexProvider()),
          ChangeNotifierProvider<selectedItemProvier>(create: (_) => selectedItemProvier()),
        ],
        child: const onBoardingScreen(),
      ) ,
    );
  }
}

