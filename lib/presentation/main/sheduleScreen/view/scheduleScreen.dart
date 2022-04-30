import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';

class scheduleScreen extends StatelessWidget {
  const scheduleScreen();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorManager.primaryColor,
      ),
    );
  }
}
