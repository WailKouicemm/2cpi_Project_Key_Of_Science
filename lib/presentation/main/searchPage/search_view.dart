import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/main/Courses/view/CoursesScreen.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';


class search_page extends StatelessWidget {
  final String text;
  const search_page(this.text);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        appBar: AppBar(
          title: const Text('Search'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=>Navigator.pop(context),
          ),
        ),
        body: courses_listview(text,vertical: true,),
      ),
    );
  }
}
