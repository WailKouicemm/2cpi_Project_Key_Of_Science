import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyofscience/presentation/Register/view/RegisterPage.dart';
import 'package:keyofscience/presentation/main/main_view.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:keyofscience/services/Authenctication.dart';
import 'package:provider/provider.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


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
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) =>AuthService(),)
      ],
      child: MaterialApp(
        theme: getThemeData(),
        debugShowCheckedModeBanner: false,
        home: const RegisterPage()
      ),
    );
  }
}

